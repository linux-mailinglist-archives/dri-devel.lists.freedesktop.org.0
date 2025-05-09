Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAAAB11F4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8570A10EA18;
	Fri,  9 May 2025 11:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VXPt7i07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3A10EA18
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 11:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRyVm/iylK80bDvjDvlV4gdHEx4XsopWFTq3PdACcA4Ox/Top8fM5SUHWPFPdr4zygHxeCfwNeVYO5g0Tt8vS06lGV20a/pNUu2cc0eW1zq09acNtF2fmXUPcEXYSdqx3eQ2f/sg0TjB5WyflRth5pskL1/kIY3YZh/8pGwlGy/p4WBEV1KzbL81zERBZcVJglmsrobpC0ljIo9NwR0aKSCNreDaZw/iKy9ZMwNbN56EotOS0IapKGFby/ZL3sHZs+NffwrYaOZkHzay8SYOsDLr7eCznnxslRn7ejNON9iYnzL5x9xbmzJQvFG7pm4no7gYZo6uDjKRgq6EioYIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id8np+2coUugRRsJvAMxzH2Fikfu+XU/yJx4+nytxrQ=;
 b=Waw9s6uhrJu3eeBoJzthZrKwuUcD8VQX6THnxtwrkzQl8prSOKcXQCZ6vdLXs35ETGL2XD29rwmQyJZqe0xTQsibZAoAR2rUSXPDw9AxTQmQEAKHtmWo4Za9OoZ0N9k8rtwRps5Ala6iqZ3dutAGcp6yvwQ1eIFyYIe9sIM0CNYx58iPJ0Sb4dYz+h9xxFDRA5uJLoD/qFcSZ5GU+UvYjlM0V2Ws4/t9SKingfatAVu2RqAjFvmqtDtPft47nyo4KzL5pNp5xGInj/kvzQRP3KVClu9ogdTt7oCxglfwxZuntJUH9zqGOY3yhLF9T+TytfD1FYZ4B90NQRqaFA7Nlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id8np+2coUugRRsJvAMxzH2Fikfu+XU/yJx4+nytxrQ=;
 b=VXPt7i07qmTev5qH48ouSPs1nL0MedY6vgUHVDK4zsSsOXNngnWdsGyGvIL5ojNKAISkySHj51Tfp7QkNaNLT7Z8IIIWp5iiAMvq1lndWrtuazXzU5IX2oh9OsOC0XYHON4CJo+EdEJYbFbg6JP5dZQ6s3AaNPiyy/4Z0ZXUGDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MW5PR12MB5597.namprd12.prod.outlook.com (2603:10b6:303:192::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 9 May
 2025 11:13:49 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:13:49 +0000
Message-ID: <f77b4c10-768c-49d3-bb19-6f06e19ca603@amd.com>
Date: Fri, 9 May 2025 13:13:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/shmem-helper: Import dmabuf without mapping
 its sg_table
To: Thomas Zimmermann <tzimmermann@suse.de>, oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250509032040.185730-1-oushixiong1025@163.com>
 <301f1962-88a5-4ea1-bfc1-826426d01ab5@amd.com>
 <a93a62b0-3252-4fed-b634-18a2e097ab7d@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a93a62b0-3252-4fed-b634-18a2e097ab7d@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0348.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::7) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MW5PR12MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e710791-dc60-4e95-b0d2-08dd8eea9289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHJ6VXJJT3o5UVNjODhndGJkWDd4a21yNVh1Zm1oWklkNEhOSnkrQTZNRjQ3?=
 =?utf-8?B?MG1Dd3VlcE8zblRWbjR1SDVQY21ORk9wY21EakdmVmYwam5HTnNvRWdmRTBm?=
 =?utf-8?B?clJDcmNEZVNIcEllSXRtWS9nb3JXTWtmQm5iRDJ0OEhuRnBhVk5jWGJKbmJV?=
 =?utf-8?B?U1hnOU55TmRxTlZkOWRLTkRGVjBKUG1UaUNGMkQwTmd6M1hva3VXNVk2NEg4?=
 =?utf-8?B?S1NZMW4xTGNMYXlIUUtHazdkZzlTbnNkMG1EQTczekVmN1JpNmZxdFE4QUQz?=
 =?utf-8?B?VngwQXc4bFRoaXVONll6cHlMRmgzcW5tMEZSWkIrVzZhWXRqcVd5eS9mVkpZ?=
 =?utf-8?B?Q0JNNS9sUkIwZ1MvM01RM2ZhVkNHc0NFNmlIck8zQ0E3eXV5QUtqTUZGQllR?=
 =?utf-8?B?M3lXeXE2djB2NEVQUFkybVZqUXlnVU5VVzZqelV0TlVneWRkT3p5V2l1ZU84?=
 =?utf-8?B?RmFtOXFVUm00dVhwZzh4d0tlTHZjbjk5ZEd6WFF1RVhCMG1FM0FGUUxYcTdh?=
 =?utf-8?B?bzhtdGxaZGZabFpiOTRwMmRpMTVpVTB1TmRwY09BSjFweDJZdFhnMVU5Q0E0?=
 =?utf-8?B?OGlzWmdNWXlFa1pPdkRSamJmZk5wSW52VW9ISzVOMDJGMk4zbnUwOVMweDRz?=
 =?utf-8?B?Um1venpJTTVSMVNsMUFGVVBUZDNJd0YrelV4bGhsOVArdTlpT0JVdDVNUHdn?=
 =?utf-8?B?bGhMK3lGUmtIYUNzbTZuZVd2NVUzdFNvcWhYQ3N4enB1MVYzb2EvNmNXRnlS?=
 =?utf-8?B?QjVDUEtaa09zc21YdGt6ajM0MGJ6c2grK1NOK2ErYVp5cHBhaG9NZ2Y0K1FD?=
 =?utf-8?B?SDEzdWpxMG00SXhsSkRxbFQ3MUhUeTBQSll6eGl1ckdLd04wZ0VNRFJ6Vk9N?=
 =?utf-8?B?WVlPK3h4dmFOak5FMk9NbTIzdmxuRUV5Ri8xUDQ2U3lJRnNjTm1YRXdaVHIw?=
 =?utf-8?B?c1l2TnpsQzlobkQwb1ExSEFBdmxIUmFja3RHQlJnNWt6QVZ3YjdsYkxIN3hu?=
 =?utf-8?B?NUlRR3dFZ3g0M3RMN3FRRHl3MHhaUDBXbXRFRUozZU5BSmZvSG5mS3RnbjB6?=
 =?utf-8?B?c01UY1pVUm1GK29YQlFQbDVlakpXeWswRkxuN2t0RDFDdW5tcEUwNlNvSXhp?=
 =?utf-8?B?a01rdEMvMWU2aXZkK1dTdWRjSEF6Qm1lcGdpd3VjTVJhQ0swMlZ5VkVHRVZY?=
 =?utf-8?B?U3RvOVNaNmk4aFpTdkxLZ0tpbms0cGdlWG1EMnAwZVdZdGpZcHVYTXpycWdU?=
 =?utf-8?B?NFZUTERwd0lDZm5sTS82V2NNbktCREZEeUd1UWJvYzU2STg1eDB3M0JSaHc4?=
 =?utf-8?B?aUV6Y2t0STA3bjBFRE50a002bE83a0ZIRGg3NTFhN2k3ZlQva216S0JwY3Uv?=
 =?utf-8?B?SGVjQ09iN2hWa0dpdVI1bHpBY1hOQTFpVlVRNWh4UGtlbGd3TjFONFN2QkdU?=
 =?utf-8?B?cDR4TXRZK2FyZmFHR0VjTWQ2Z00rSTVVL3lnUUhWYnFMM0cvTUJEbVhDT09a?=
 =?utf-8?B?OHdabzI2QWIvbU53TUY5dFk0UFRVMzAyclo1SENMWmpwajFwdTFVMmZadU5Q?=
 =?utf-8?B?aVFMRXkzU0Rnbm45OXVuNHF2TmlkUlhOcS94UGo0aVFlV01OUUhWTzFtcUNF?=
 =?utf-8?B?QVIvVVgyV0x0em56cWh6MkJ1TzFUWG14dm1lNEc4NytUUm0zL1h4N1hCU0lo?=
 =?utf-8?B?d0JHeHRVdlV1d0pEdTFBWlg1TmJCK0M4NFFqaUNQYXlOdWZySTgxSWo5Uldy?=
 =?utf-8?B?V1d6c29mSHY1UzZ5dHF5Zlh6UHBwL3NzTE5WV2tLek5GYkMrTFV1ckgrUCtq?=
 =?utf-8?B?Vk1DWFVmVmI0ZXkvQ2JWQndVbFFxSVNVV0s2S3RhTE1vYzJUR2JQaytseU1W?=
 =?utf-8?B?TDk5SVNwWmZ4QlUzbHdBZ3RBVm5DM2ZsSlFyNzV1YzRUcUdQd0dmOSt1blR1?=
 =?utf-8?Q?JakH38Wo1r4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlEQ0t2NnMyMGx4YWxOWjBVakMxVFJyblNBZ0VocWI2SEJQaEw1bDlicDdG?=
 =?utf-8?B?Q2NMemY2YjBqV2FYcnNBQTNZK2FqblFPWVpTVFhlR3hNUy9uSWU5cXl5R2o3?=
 =?utf-8?B?aEd4UWE1cWJPcVlhYmxoRW1yUDFmckJ5YXU5VU9WV2dhUXlaOG53RGo5VUcr?=
 =?utf-8?B?TlZ3b2E4Y2ZBY1k3RnEyR3RhVm01aWNZWWVhRVViV250K1RjSjJpcDZiWEtB?=
 =?utf-8?B?KzludUpTZlYyT0NvNVFaSkl1SXJ6bGg4WTlyNHlxOHo5V0duUURFSzloZjRw?=
 =?utf-8?B?M0w5ODRRRDR1L1hETEVSLzQ0a1VpTjd6N3ZBMTZrWFo0eElDR2Vsei9vaDJH?=
 =?utf-8?B?UEo0VVlnamxXVzl3SnM0ZlNzUmMvYWc3Vkdqa2tPV09nNVVzNGVBeVhxNDFP?=
 =?utf-8?B?ckFhV3RweU9EU3NCaGl3SGp5eVdoMVVGRnYxQU12NldjUFpNSDVuL3Z6N3Fi?=
 =?utf-8?B?WUhNTTYzZS9KcVNUaDlqVEF5TkpYazJyNFRzeS90RTF1K2lJaExMa2RFejUx?=
 =?utf-8?B?TzBPWFZ3RVBhWDE2TkNQZXhiNkxsVG83OVJ1R0hxckhkMHZ2VXdCampkU0k3?=
 =?utf-8?B?VHljVjdxZjFlUlRvbVVud3R2M2JibFN0NDRWazZpUW1nTDAxSnVKSVJQZTdJ?=
 =?utf-8?B?QXZzQkdnWWY1RW45MHU2QkdKL1BzRE8wT0lyTnBqMkRVUmVRZHZrVjg5RUNr?=
 =?utf-8?B?dURWK3Y0cDBpSUQyZmZYVnptRmdFdXFyTDRqTTZQZjcwV2VER21zaFpQcDhD?=
 =?utf-8?B?dlROaUtVU3h1WEduekdOQnRMUFpXWnVaLy8wdDF2YUd0OEgxSGV1cW5xQkhp?=
 =?utf-8?B?djd3OW9yaE1iWjRLbThRZ2RSU3VTR2w2Z1NYclJQc2VwNzRvS0VONk5Cam56?=
 =?utf-8?B?am1XaU9yT0E3ZHF0ck91OXpSWGpTTzVmdHFDaDEzNWsxZlJvYlorRDVac1Iz?=
 =?utf-8?B?VlB1OXhqR202MythNldYcjIvTm5CN2xEN1UrbTV3TjZ5K21ZODhGcHBUTDJD?=
 =?utf-8?B?MkFWU0Vkb3FqU3FQS2tkbjl4TjZ2dHg0N3kzaWwvK3lncmh5bHE1VG9Edkw0?=
 =?utf-8?B?QmVxSG9OVGMvRWFnSm5RRXpTZ0x5d2FVNTIxcHdwT0VWSjVpbDV2WWVKdlU3?=
 =?utf-8?B?UUM3ZzFzK2plWWRxRXlGUkJENFFFcUVrZDhnVEdrUUlzcHBIQjlDOG1lSDZy?=
 =?utf-8?B?UFhQSW1NVHFkYzZTQW9XMytVOFprS0RTa3k5RGJGaUcwZURHQmJxbWJ1R3hu?=
 =?utf-8?B?U3F3ZXJTM3NLRE1YVDhyRThQNDdtd1FlSi8zZFo2c1QyT3ZIb0pQOGV3OGJy?=
 =?utf-8?B?dFY0eG9ERjdPOGlQRndETTZ6Q0FYSWNqaDZOaTF1clVDRDN6Nm52Y0gwajcr?=
 =?utf-8?B?WU5uWjBkY0ZkKzN3VjdaM2wxWkpqVi9WRE9raHZwZUZQNXVoZUZlQmFVYlBK?=
 =?utf-8?B?NUxCc1BCd0VkaTlEY2hDVHdFWlNQeUlQOVdRdFJabHRyUFA3L0lya1crWmlU?=
 =?utf-8?B?QnNCUmU5SXlwelRTK0pWK1VkcTlvUGpTZFlNUm5TOC8vZHk5TkZXeXBFN2JU?=
 =?utf-8?B?M0pvSFZwUEMvK1ZFT1lyaml0M2xtbWRDZFlXZi9JclFuaG9WdkRkU2JIc0N4?=
 =?utf-8?B?VXorSk9UbnlTd2lQNE14dDJmdzJvN21SU2YzL1drVE5ndm1rcWxJdHdBSENZ?=
 =?utf-8?B?WnhwNFhlWjNRc1p5RmQ1eEtIUGpERGtPd3dHVGkrRlh2L3JjZmFXOW5tWEli?=
 =?utf-8?B?c0RLT1duVWVON040amRqTFhMNy9iKy8vTVhXd2FSbS90VklOYWdQT0dRZkpp?=
 =?utf-8?B?U295bTR5SzdBT3dFY09lcWwrU3hla1VPQzlqNmxwYlRzRUgvck1aT2FqTUJ6?=
 =?utf-8?B?bm5qWFBnQ08rbEpTb3AvblMweU92bTNFNG9iTjc4OEhYV1dpZllHOWV4SHg1?=
 =?utf-8?B?RkZ0a1BBd0lvaklHK1liSVJIMkdtdnQrMXN0THk0dVNZSWNLWXh1QnJsQWRh?=
 =?utf-8?B?VnVSQU53RXR4d2g5RndMT0QrZ0Mwb0lIazV5VnNjb1FWRjg5ME5kQUF0d3M0?=
 =?utf-8?B?NEpLaEFzZkFaMjZmVG04R093Z01Rb05qaStxODF3RkR5OGthczFQQlJoS3BG?=
 =?utf-8?Q?6uOb7FGpiqiMQgiJ/uO5qQqKX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e710791-dc60-4e95-b0d2-08dd8eea9289
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 11:13:49.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyNu79HE8lsI0ijpwxeXUxWEVmDfoO+YPIHH26fHXxOmbkdKPjZPyzGzcf7yCgGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597
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

On 5/9/25 08:51, Thomas Zimmermann wrote:
>>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct drm_device *dev,
>>> +                             struct dma_buf *dma_buf)
>>
>> Please don't mention "no sgt" in the name, that we use sgtable is an implementation detail.
>>
>> Maybe use something like "no map" or similar.
> 
> To be fair, I asked to not named it something like _vmap(), but rather _no_sgt().  These vmap-only names purely describe a use case. I'd be OK with any name that refers to the difference between the various functions; not just their effect.

Yeah, but "no sgt" is as equally bad as vmap. I don't know a good naming of hand either.

> 
> Unrelated to this series, we might reconsider drm_driver.gem_prime_import_sg_table. If we move the call to dma_buf_map_attachment_unlocked() into the callback and rename it to gem_prime_import_attachment, using sg tables would become optional for all drivers. SHMEM would be able to create the object without SG table without having to reimplement the prime boiler-plate code. Thoughts?

I'm not sure if that would actually be better, but calling dma_buf_map_attachment() should indeed only be done when necessary.

For amdgpu we put that into the TTM TT backend (see function amdgpu_ttm_backend_bind) and I considered switching over radeon and nouveau as well but then just abandoned the plan as to much work.

Regards,
Christian.
