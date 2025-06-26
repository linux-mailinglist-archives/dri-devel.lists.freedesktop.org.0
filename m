Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A8AE9FBF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5288F10E8AF;
	Thu, 26 Jun 2025 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XC+F+x0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48510E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pmt5UPpWV7j5QgugdJNJLM7V+9CVMUS/x9bKzi9vMLNfixDXlhOP+ng/rQF6Np4Kxo3NipXkMqGQ5HNSpiDfUeEG70soEg6a/B42864CTe3Obfui7c3IElE1Kc9BIjW7YUkXOlFwhqorA4SJ/UC78DzEbCDapAm6qEWfnFxDMDoAOFX4YJjPByjLO2tZ6W117Mei+Bux/DpLF3+2TOUCeIhZk1Qf33zgxSLcjT/NYFNlc2DR5dgKS6/BM94uy3n+X4vMerlPJjnEzs2VKRcRqj+2jMgyyBpL7FMSsXSv0vR7MVcaZkP2HnlagKeeoaULtlnrePtNShLKrCH/IwMFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OT+M9otOSelfLlZ98aMgo9FpC82F9bw8sV3pjvPXTY=;
 b=V4ERTPyv3WwRlLTUBDc0rYC5UjgBKiWBwatc9m84Y5pU22wC7FwjTPdyvMYmWlqXIxuM0ZshjhTeE7Gc2CEMLBWhd3NbHGx35Af3ilGxjukh8HFNqXVAK56VquGoJN7bOfffiLUNYUnsYZw5bltbYeXOY5fXIjIVFisTYykiQbfZBRG0cSFuj6zXsTOlwAfliTp403gPUE4wPyOcMxnl2yqGumrvnWCNxGgE+4rDrQ+YQ7GiJ6GLD8dEFSVaSex+nhU0qvbPvjQb+W5q+gUFYIf/2lzMnHSFrCuYqBi0E1TtTVtFh9IgRgebVie06wdJSSeRElz5AvSst8sC3yO9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OT+M9otOSelfLlZ98aMgo9FpC82F9bw8sV3pjvPXTY=;
 b=XC+F+x0f1aFMCjS+DwwCs0XgOknYAU1rRg39WjLGfHJXPXg36lOxrU9OIepiNhXSqd+bZvNb1iHHaLp5CGoa1spO953RFCzkWmqTAS16id7xMs3PkZD4Qkbsgk/Es+2a3Sdt1L+w5xdKo4OyJG262/2/z5gQpcvq1epvpGu7aFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 14:02:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 14:02:31 +0000
Message-ID: <901073b2-e806-4597-899e-69a949d7aef0@amd.com>
Date: Thu, 26 Jun 2025 16:02:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/gem-shmem: Use dma_buf from GEM object instance
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Anusha Srivatsa <asrivats@redhat.com>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-6-tzimmermann@suse.de>
 <CAN9Xe3QU_goD8ca9_dCew3V=U22SUbVmOri1p+fwiicJKNa6wQ@mail.gmail.com>
 <ff74c4c0-9876-4d62-a099-12061bca1cea@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ff74c4c0-9876-4d62-a099-12061bca1cea@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d6e721-c1d1-42ac-4617-08ddb4ba180c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGUyWHVjR0YwR0NTd2lVMDJSSU1TZUVjVk5wc05DKzBYRjZSa2hFbm5GL3dX?=
 =?utf-8?B?SzNnL2tya21RbEhmT25hbVczeFh3N2VhcFp6WEdIOE1JZjlKNFdUL0wvSGI0?=
 =?utf-8?B?S3dnL1cyQjBCNXUrd2xKRGlrZEFNRm9GblY3dTIvOTQybFdMN2J2N0QzNUtG?=
 =?utf-8?B?RmhMTnRkS0FoTHQwRThKZHluZU9RSkxSUmkzaW9WV0JER0JRMFN1YjZXOXZo?=
 =?utf-8?B?REczNjQyQVhmbFpZdkEra3h0R0E4aCs3WkwzcXVSTm5GdEdyY0RqSWhMbHNY?=
 =?utf-8?B?ejA3V0xDQkUrQ2RNcEo1V0JRYktoSG9LSTJUVk5GZjd1bGxHdWJVc1VXQXNx?=
 =?utf-8?B?dldUeElzR3N2ei9CRTl6WmxQYWZRazM3dEgvdmtwQU8yWGo4c011U0R1YkRM?=
 =?utf-8?B?MW1rcWM3cHNwWktheUs5UDJmOTg1aGNBMVhRZVhtMUFJTFd1cWZ1YVovcy9H?=
 =?utf-8?B?emd6MmNjS2k3L2R0ekthYmVHS2RHZmdacGEwSlBZYlgxdXFMd21vVVBMM04r?=
 =?utf-8?B?dmh2Y3RGUStFb2VJLzNyMC9XeHIwYTh3dXFqclRCRFJnd05VWEZrL2NKVHZE?=
 =?utf-8?B?WWl4S1hHSVBlcmZKcVdLc3lENE84T1pZd3R1OWhPZ2ZoaVhWNERoYktSMk9s?=
 =?utf-8?B?WjBhdHgxMExLWG9Mc0xSRkNBM1pMM2lIVFJuYkQ0N1pGeG9Wd3BtbG1yMng3?=
 =?utf-8?B?aVl1aEcyQmEvYmlNcThhNzg2VXZDaittR1pHMHkvVGhxaFoxd3FoSTdaMDNx?=
 =?utf-8?B?eGIzS2dWWndZS0pjWlMxRzc3bS9ZazZJR3psSk0ySklNdDIyak1ZL1FZekNp?=
 =?utf-8?B?R1RycTB0YUlSU3VhUlY2dzQyK0xVL09jWXQyMXoyU1dmSGlkcysrRUltYjhu?=
 =?utf-8?B?QUcyY1NDYjRRcnZ4SmxmdWMxMzFIYWJwOW1SNFdZU2lwOW05MzVwQ0FtYncv?=
 =?utf-8?B?aW1TKzBGVVdsUW9iOUVtZ1R5Mi9EdXFGOWEyL3MzSlBkMmJQdzd3Z0E1aU0x?=
 =?utf-8?B?SURxMTBtRUxpNWcvcjUvdlRjbEtsSzZMRTFIczU3RXVPbXRkVk9PejIrVW51?=
 =?utf-8?B?dmo1NElqcmlKUEtwNXQyUVAwK2JNVXNqOWMzSnUwbGJaVG9NRlpKd1FQQ21N?=
 =?utf-8?B?c0JMZHNXNjFlb0pReWFkbjI5emw0cHllTWFvbVFxQkVoTTk3eEdWRjY5bCtM?=
 =?utf-8?B?b05ScDFnVHVnUkpidXN2TU92aGFHSTZWUElobjREUHVTRmlYYk9hNzM3eVdz?=
 =?utf-8?B?VmZnNHBsQ1JCY3F0MU1QK3l5bTZQL1c4RUd0ZHZMOHZXVmtPNXF6UTNDaC9F?=
 =?utf-8?B?Z3ZYeVM5Q3VyYjZvNVR4WHhwRXpXdFJTeENwdGdPZXVZaWdzUmZzREppaUx3?=
 =?utf-8?B?d1pkNk9nMVdaajRLYWxaVUVBSzJGUnFwd1ZQYWdMaTBYdFVib0FtLzN1c0NW?=
 =?utf-8?B?UVIxVlE0RWhSQVdCSW5MdFJZb2tPTUtzbkV2cEQ0c2xScloyOU4rc0laaURI?=
 =?utf-8?B?WldZYlZJOUxycnNpYTZ1N3lFaWp3VnpKdlJZR01wdHM5cG9GYUhYV3l0TDBh?=
 =?utf-8?B?dXlvTGs0Wlk5VUlzL2dZdUROWEhSb0xQc2VzanErSWM5NW1lTFZqS3hxMFNr?=
 =?utf-8?B?Q0V5Mk9ZOEpNcXh6UnU4YzF2VllIZGxWclUreXpneGdjRVNiYVliWGxEVlVu?=
 =?utf-8?B?UkVMM083b1oxUWUzbHpRcUZqYkw1enpOWWRKWlZ5TWVOa3hmMi9nM0ZMZ0Z3?=
 =?utf-8?B?SFBPMTBUNGlZZEtGUWNBS0g5cmZaSjdsWXBJb1gwT3ZjRDFHVlY5Rk91V1d1?=
 =?utf-8?Q?cikNt+3+gTZ03Uff3Z1ZhEbQvWlc5zyahaaC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3l1SE4vdm5VVXpiMXlXV2tYOFdrRHYybnRvYTJrQytPaktmQ3ZObmF6dlBi?=
 =?utf-8?B?bnU2TmYwNENSbmxHbERxTXltU0RuQUxDeVdBdC9SS3FoVjZKMzRiMk51cTlG?=
 =?utf-8?B?VHVqMHZCZjNNQ1JnY2hYUFRteTRKOWFFUDJFcHJSS0hHK3BESVpmRmJpRlp6?=
 =?utf-8?B?eGRFWTYwVTRUMTF2bUg5bmFLZTVWV1dwKzBFYy8wdTNuZ1R6MnljQXhJK0Fz?=
 =?utf-8?B?UDdlUkZhdExuM3ErNTM4a2RKa3NaMmxvcXN4b1JsVzdzZHFtV3JBVU8wSkI5?=
 =?utf-8?B?UTRjTlFQcktPQzk5QkNzc3J2Ri9UenpqQjJ2Y2E1V3hCSUxTYzRubllaMDZO?=
 =?utf-8?B?ZDZaVnUwUGRxcWJCQ0kyU00xdEVaa2h5eXJFY2NiYkVBbEk5VEJJSnZwUkpZ?=
 =?utf-8?B?ZzRGaWp3RFd1eVRPRTlmdzY2RUlHa1YycUlXSTJmN2F0eVcyZkxWeFlPVnln?=
 =?utf-8?B?YVB5T1p0WEd3N3BmWDZRdUEraXhzbDMzalVBRm11d2UzcjFTb0JxWElmL1Vk?=
 =?utf-8?B?SjlIcnZoWXlBa1pRckQ2cW8xYzdPUEhpQVl2c1FsQk5tazJGbHZnZkhEeUgw?=
 =?utf-8?B?bWNYZE0xNTMxaENyMzlDb1ZZNXZpNlBiK09qNElNaEc3NVdYaW5YbTdFenR3?=
 =?utf-8?B?SlVXN1krODdpciswSnRJaXlwdk5oWG1sRkNXVnRDbUUrRVh2UjUzNVpLVFRX?=
 =?utf-8?B?NFJLZG5LNXEyRHdzSzVNQ1lZYjhUaHJBeUFUdHNoMmlza2VWSnFNeWxXeVVz?=
 =?utf-8?B?MGpidDhudWo2M0tQRlVZOHIrenpaNk9EYU9tK1RoYjZaRWdkTEhWVXB1L3J2?=
 =?utf-8?B?Q0Z3dXNaK25udXZjb3V4V0xvdnNCY212cDJ3MGNKbk9FR1FyaTZib3dKaDll?=
 =?utf-8?B?YTA0VWkwdHVEbUpHSUF3eWdQMjBkbVNidHM5SHVqK3RiZStrSDZOa3BmK1Bh?=
 =?utf-8?B?VFU1dWNyTjRKNm80K2RiTGc4Z256eUwweGNIU3pLdWc1V041NGhsYXdQUnJw?=
 =?utf-8?B?dVdkdHJvUVZLeWQ2dS9jeDRLcGZnbGdaUHZ1MkQyWDcwRDNsUiswQVVZSksy?=
 =?utf-8?B?VFVENGxYcFcrYWhHWnBhenV2MDRzZ05xMDRKQjNlWm9hTXF1di9RbnZQaTFr?=
 =?utf-8?B?elk4MXR0TnFUOEQ3UXdYQmFLM0MwLzBicHhERkt5WFJhU1p0Y3ZsWDhCdlgv?=
 =?utf-8?B?ekdocmRpcDBwTlUvQVRuNVUyaHRRTUgrUzRDbWFKcEo2a1c4SkdjR0RZNmlC?=
 =?utf-8?B?ZUp4YUpEZkdOd0xBaGZlUXZwSXhGdzNxOTV3MXpvWmhjc2ZzdFpSekFDaytI?=
 =?utf-8?B?MDBIdjZkT2kvNW1pbUFsK1dVaW95em1RNm0xOFFrUHNKN1dORFJZRmNJWldC?=
 =?utf-8?B?K1V5YWtrRGFuODNka1pQdmpjeEtxNTZ1YkI0aTl5RnFieVdHb1RSb3ovVHll?=
 =?utf-8?B?S0JjVFNWL1dQbFBBc005TnVjVmQ4Tksrb1RuRkhZbkk4SDlpMXo4Tld5TkhO?=
 =?utf-8?B?SXN4aXhqYXNjZTVrR0N1UlBGOXlQOENvMWN0WkRqbTR2M0VCM2k1YVR4bjN2?=
 =?utf-8?B?S2JPRlZhNS9LbmZka0VINFF4VTRNMG5uMU43MUFDdXRwYzN3b1dJT3dxYThB?=
 =?utf-8?B?ZzVid0Z4MW9Fa2RoczZSRExwZTBpRTJFVFVHcU1rMFh4R1IyYXJUYUNudzNo?=
 =?utf-8?B?VWRQZXhZZ29tOEhhUjlGYTNtTU1KQWVqdnFzL1EzMVRmM2luaktjT3BZODZo?=
 =?utf-8?B?WHU0d2JjdmJ6UTU3S2Z6Y25udC9BajhhUmQvcnVMVkFzdVNwc0t2TUVoL2hE?=
 =?utf-8?B?OFYyN0w5eFAwTWRlVEJ6clREWFl2SVh3bUtKVFlqdENHZUVrSkRCa05sN2w0?=
 =?utf-8?B?MjVmamlTMlIyQ1pkSDZTdWNmZFlidEs2aXYyaW1BeUN0VGtwY0xUOWRncXZz?=
 =?utf-8?B?dEQ0RXdtSXFtTnZzcnRlUDJRNU84V3pQSXlCSkR2aU9DUTRyM3hXY1hFeDhn?=
 =?utf-8?B?Sjh2MFplaWFYWW04N0FFaUNyUisyMkxYakJCTFVCck5vYzc5MDJka3AzeW1Z?=
 =?utf-8?B?Ym80SFZaSXZoTXliL3ZBSTNwZlBvMzE1WGRYdjRtQzU5bk12cWYxYS9pUnpK?=
 =?utf-8?Q?84lccGnF3pCBSRfRaW0uYMcM5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d6e721-c1d1-42ac-4617-08ddb4ba180c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:02:31.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRBds2KnTB3iU+Hau6pPddru3Sp4KAEES0/pyvTiGZHtvbbPIIE08DxZEzsxWN0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.06.25 15:39, Thomas Zimmermann wrote:
> Hi,
> 
> this patch triggers a NULL-pointer deref. Stack trace is below.
> 
> Am 28.02.25 um 17:26 schrieb Anusha Srivatsa:
>> Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>
>>
>>
>> On Wed, Feb 26, 2025 at 12:28 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>>     Avoid dereferencing struct drm_gem_object.import_attach for the
>>     imported dma-buf. The dma_buf field in the GEM object instance refers
>>     to the same buffer. Prepares to make import_attach optional.
>>
>>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>     ---
>>      drivers/gpu/drm/drm_gem_shmem_helper.c | 6 +++---
>>      1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>     diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>     b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>     index 7722cd720248..d99dee67353a 100644
>>     --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>     +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>     @@ -339,10 +339,10 @@ int drm_gem_shmem_vmap(struct
>>     drm_gem_shmem_object *shmem,
>>             int ret = 0;
>>
>>             if (drm_gem_is_imported(obj)) {
>>     -               ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>>     +               ret = dma_buf_vmap(obj->dma_buf, map);
>>
> 
> 
> What I see is that ->dma_buf is NULL at this point.  The sequence of events is
> 
> 1) Import the dma-buf into a GEM object and set the pointer at [1]
> 2) Release the GEM object from user space and clear the dma-buf pointer at [2]
> 3) Use the GEM object for a plane and try to vmap the dma-buf here
> 
> [1] https://elixir.bootlin.com/linux/v6.15.3/source/drivers/gpu/drm/drm_prime.c#L406
> [2] https://elixir.bootlin.com/linux/v6.15.3/source/drivers/gpu/drm/drm_gem.c#L241
> 
> Step 3) should likely not happen before 2). It looks like a problem with ref-counting? Or is this intentional behavior?

Oh, well that again :) That is most likely a bug I've stumbled over before but in a different context.

The problem is that you can created a FB, close the buffers the FB is referencing and then try to display the FB.

The correct solution is most likel to increase the handle count when GEM objects are used in a FB object instead of just grabbing a GEM reference.

Regards,
Christian.

> 
> Best regards
> Thomas
> 
> [  156.791968] ------------[ cut here ]------------
> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> [  156.805923] Modules linked in: udl(E) snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) snd_seq_device(E) af_packet(E) nf_tables(E) iptable_filter(E) snd_hda_codec_hdmi(E) binfmt_misc(E) snd_hda_codec_realtek(E) snd_
> hda_codec_generic(E) snd_hda_scodec_component(E) snd_hda_intel(E) snd_intel_dspcfg(E) snd_hda_codec(E) ee1004(E) snd_hda_core(E) iTCO_wdt(E) snd_hwdep(E) intel_rapl_msr(E) eeepc_wmi(E) iTCO_vendor_support(E) snd_
> pcm(E) asus_wmi(E) intel_rapl_common(E) sparse_keymap(E) nls_iso8859_1(E) x86_pkg_temp_thermal(E) e1000e(E) platform_profile(E) nls_cp437(E) snd_timer(E) i2c_i801(E) intel_powerclamp(E) battery(E) i2c_smbus(E) pt
> p(E) snd(E) vfat(E) coretemp(E) rfkill(E) intel_wmi_thunderbolt(E) wmi_bmof(E) pcspkr(E) mxm_wmi(E) fat(E) soundcore(E) pps_core(E) i2c_mux(E) xfs(E) acpi_pad(E) button(E) mei_me(E) mei(E) joydev(E) loop(E) nvme_
> fabrics(E) fuse(E) efi_pstore(E) dm_mod(E) configfs(E) nfnetlink(E) ip_tables(E) x_tables(E) i2c_algo_bit(E) ghash_clmulni_intel(E) drm_buddy(E) sha512_ssse3(E) video(E) hid_generic(E)
> [  156.806220]  sha1_ssse3(E) aesni_intel(E) crypto_simd(E) cryptd(E) usbhid(E) ttm(E) wmi(E) intel_gtt(E) drm_display_helper(E) cec(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) msr(E) i2c_dev(E) efivarfs(E)
>  dmi_sysfs(E)
> [  156.916628] CPU: 2 UID: 1000 PID: 2255 Comm: KMS thread Tainted: G        W   E      6.14.0-rc4-00399-g1a148af06000-dirty #62
> [  156.928010] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [  156.933253] Hardware name: System manufacturer System Product Name/Z170-A, BIOS 3802 03/15/2018
> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> [  156.946529] Code: 48 83 c4 60 5b 41 5c 41 5d 5d c3 cc cc cc cc 80 3c 02 00 0f 85 5a 01 00 00 49 c7 04 24 00 00 00 00 48 85 db 0f 85 8b fe ff ff <0f> 0b b8 ea ff ff ff eb ba 48 85 f6 0f 85 51 01 00 00 48 89 54
> 24
> [  156.965374] RSP: 0018:ffff88810a5cf8b0 EFLAGS: 00010246
> [  156.971341] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: dffffc0000000000
> [  156.978539] RDX: 1ffff1103183cd19 RSI: ffff88818c1e68c8 RDI: ffff88818c1e68d0
> [  156.985742] RBP: ffff88810a5cf928 R08: 0000000000000001 R09: fffffbfff754ad94
> [  156.992928] R10: 0000000000000002 R11: 0000000000000000 R12: ffff88818c1e68c8
> [  157.000385] R13: 1ffff110214b9f1a R14: dffffc0000000000 R15: ffffffffb95eb1e0
> [  157.007599] FS:  00007f45327036c0(0000) GS:ffff888417000000(0000) knlGS:0000000000000000
> [  157.015735] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  157.021527] CR2: 00007f9980a04cf0 CR3: 00000001263c4003 CR4: 00000000003706f0
> [  157.028729] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  157.036237] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  157.043420] Call Trace:
> [  157.045898]  <TASK>
> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> [  157.065567]  ? dma_buf_vmap+0x224/0x430
> [  157.069446]  ? __warn.cold+0x58/0xe4
> [  157.073061]  ? dma_buf_vmap+0x224/0x430
> [  157.077111]  ? report_bug+0x1dd/0x390
> [  157.080842]  ? handle_bug+0x5e/0xa0
> [  157.084389]  ? exc_invalid_op+0x14/0x50
> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> [  157.092548]  ? dma_buf_vmap+0x224/0x430
> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> [  157.152735]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  157.157810]  ? __pfx___lock_acquire+0x10/0x10
> [  157.162229]  ? __pfx___lock_acquire+0x10/0x10
> [  157.166680]  ? find_held_lock+0x2f/0x130
> [  157.170728]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  157.175759]  ? do_raw_spin_unlock+0x55/0x230
> [  157.180125]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  157.185152]  drm_ioctl_kernel+0x141/0x2b0
> [  157.189223]  ? lock_acquire+0x1a2/0x210
> [  157.193137]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> [  157.197750]  drm_ioctl+0x489/0xb30
> [  157.201240]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [  157.206287]  ? __pfx_drm_ioctl+0x10/0x10
> [  157.210273]  ? __pfx_lock_acquire.part.0+0x10/0x10
> [  157.215153]  ? __fget_files+0x1a2/0x2f0
> [  157.219048]  ? lock_release+0x130/0x2a0
> [  157.222947]  ? __fget_files+0x1ac/0x2f0
> [  157.226868]  __x64_sys_ioctl+0x12e/0x190
> [  157.230964]  do_syscall_64+0x66/0x150
> [  157.234701]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  157.239813] RIP: 0033:0x7f454811916f
> [  157.243425] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
> 00
> [  157.262274] RSP: 002b:00007f45327019f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  157.269929] RAX: ffffffffffffffda RBX: 0000560b36153720 RCX: 00007f454811916f
> [  157.277138] RDX: 00007f4532701a90 RSI: 00000000c03864bc RDI: 0000000000000014
> [  157.284321] RBP: 00007f4532701a90 R08: 00007f451402dd40 R09: 00007f4514000090
> [  157.291552] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c03864bc
> [  157.298761] R13: 0000000000000014 R14: 00007f4514018740 R15: 0000560b372a9c80
> [  157.305985]  </TASK>
> [  157.308223] irq event stamp: 16371
> [  157.311672] hardirqs last  enabled at (16383): [<ffffffffb66c4c0e>] __up_console_sem+0x5e/0x70
> [  157.320365] hardirqs last disabled at (16394): [<ffffffffb66c4bf3>] __up_console_sem+0x43/0x70
> [  157.329049] softirqs last  enabled at (16410): [<ffffffffb650e832>] handle_softirqs+0x502/0x6b0
> [  157.337831] softirqs last disabled at (16405): [<ffffffffb650eae7>] __irq_exit_rcu+0xf7/0x160
> [  157.346424] ---[ end trace 0000000000000000 ]---
> 
> 
> 
> 
> 
>>                     if (!ret) {
>>                             if (drm_WARN_ON(obj->dev, map->is_iomem)) {
>>     -  dma_buf_vunmap(obj->import_attach->dmabuf, map);
>>     +  dma_buf_vunmap(obj->dma_buf, map);
>>                                     return -EIO;
>>                             }
>>                     }
>>     @@ -405,7 +405,7 @@ void drm_gem_shmem_vunmap(struct
>>     drm_gem_shmem_object *shmem,
>>             struct drm_gem_object *obj = &shmem->base;
>>
>>             if (drm_gem_is_imported(obj)) {
>>     -  dma_buf_vunmap(obj->import_attach->dmabuf, map);
>>     +               dma_buf_vunmap(obj->dma_buf, map);
>>             } else {
>>                     dma_resv_assert_held(shmem->base.resv);
>>
>>     --     2.48.1
>>
> 

