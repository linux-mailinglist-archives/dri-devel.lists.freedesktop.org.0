Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552A9B4A76
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EAF10E64A;
	Tue, 29 Oct 2024 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vIvlCYmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA9A10E64A;
 Tue, 29 Oct 2024 13:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSR55yCMK5IRzLzeiYLW6zLKSV3che3ztgLBM8qYvpWroc0EYJtMf33d38pop/RNtTO8/YZHiPIgSsH3lT9/RdWliDxfr6fP6dKsQbwejVXlJ80iR8WHfGkwqz3uLGmjS+Ei4MwgZuW4yBN2z3pW/LgGYz0ndgjl8oAIHmpFcOeaScay30Kaq6yZ2IHjQ+7Z/7sjSBa7pnshwW0sSuMyLcDibPNQ/JQFwuWYtQ9UsMKKqrzR4lJfOFjJ7vurFCe1K19RveSO8tdMIfDsU7d2flAYT4stMHB0KiB3AiIfI8e8hb7IeUGPyyANEQvitMpMyVEJEcNErvD1bXE8GwuZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3DJaqGFLqQ5GIjs7ZUhXWCXV4SU9mb2JmcCs7irzck=;
 b=IKeqN/uSCW8WKmfz15P3Z/+puNe3W1pmCwuaGXrg7KM6FEbaOzZilB6CEDfpVgYzjG6GUFhqDoKIHGXCbLXRsohpujWlU/cItfYimvIFUvRWywLf6PdGiYkrDwHm0a4zKMuez+mG6n2DsusjHkjtnBzj322jE+DJTkHhOKsxRuPIAnl8xFE4NxlTJF80VorRDy1T9I227SLi6sA/QcJGUWYdOakmbAzq2DhF5pWBR0v9hNI65EBw1FQM1zIZ+0vv1XQ6CIoOVO3ykw8KoxdHrDoEQwdgGe7YrAvEYyBsK7xbUX83Ee/x4uJvSJ1TcerRkJs49/5AAYx68pA90Dtbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3DJaqGFLqQ5GIjs7ZUhXWCXV4SU9mb2JmcCs7irzck=;
 b=vIvlCYmmtqJdwI2Dk6U+7IEEhN44lpd0KoP/pe2mrZAFxkp/MNTarRlfQH+jnFFEJbTxBNTaYGrVER0KnWQe6x7QCDJyUacHvNU/Aoleki+HQwkIz6tCdqjiAVHDcUmXSIIFlCGUgbsQj4qrLLc7DCuIiWKip3oXSyZ76+OuR64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 13:02:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 13:01:59 +0000
Message-ID: <7413545c-62e3-4d27-8522-ea6f579c8195@amd.com>
Date: Tue, 29 Oct 2024 14:01:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] PCI/IOV: Restore VF resizable BAR state after reset
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-2-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241025215038.3125626-2-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: dc893da4-115e-4027-3fc9-08dcf819dff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmZwNXhLVGhzV3k2amRVOStkZ1ZaRzYvenY5SzRXWjJyM3JZS0ZzUzcwVWlV?=
 =?utf-8?B?MGkydFl1RGhjanpoNll0MTE0QjZ5cGx0S09LTUcvbkhjNHg3T1QvZEp5Wk10?=
 =?utf-8?B?L2ErckJpSWM0eWJuRXc3c3BNQUs3dmpOVXV4QytPTDNreDNDYkFoa1B6Q2JP?=
 =?utf-8?B?TGFjM1ZUVkNkRTZyMUdIRGExQzlsbGx3aUprSlFRS0NlaXVrdE12emhjUVha?=
 =?utf-8?B?ZHo3QVpCQW1xK3NXUk1ham4wbkl0dzBETFRQcmNJdEdoemRZcTBxYklUTjFX?=
 =?utf-8?B?RHdmUkt5SEpwMllTVjFUSDNEYTUxUXlNcUticU5NQzExb050blAyeDcwR1JD?=
 =?utf-8?B?VmhLdkVuUTRYdXhwNFhqRkxmeG5hVVhrVjF2d2FraDJFVmJBbW1SQXdLNGRU?=
 =?utf-8?B?QXNpZWxtRDVFZ2dvWnFkazZhMGFGc1MrZXVXNUFENFN4dDQwQWdHSm9HVFQ5?=
 =?utf-8?B?cGFrUEhNcnRKQy91VDA1Z29iYzVTUVltbUErME8zK0lYb0VZaVRaYmRPc2Nq?=
 =?utf-8?B?M2JqM3VGKzFuUlhuTzIvWnljM0Y4S2NyWEdiak9xclp4aVptWVdIZDYyS0k1?=
 =?utf-8?B?RXhvamhDdlk3dEJzWXlFTkRpSU9mTThTMk9zdUxGQXArc1NZK2JsQ2pOUWdW?=
 =?utf-8?B?aXovUEJoTFgwSTZFWXQrd3RMVVRMYjhCRWdpeXV0b2EwUGZVYmJtL29KNFNx?=
 =?utf-8?B?b2RLUHdrdjN4UHlUU2JmZ0hoS2pCc0FIS3hoR2JpcW9RenRNWUF5K1RhbzF3?=
 =?utf-8?B?VDdaK1psY3JsdHBia0F1WEZkaVJ0TjNTVmg5azRxeUZJaGNGWUdOaWNIR3FT?=
 =?utf-8?B?Q0NBVVl6Y0JLNkJOcDAzWHB5c1FSVEJlOGh2WW1zVUxoWWJaS0hITktmK3pY?=
 =?utf-8?B?cjZkVjd4T2xBd1RhWmRMY2trYlVrT2ZtZ2g4TktKU3UxemJiTUpldS9yRjNv?=
 =?utf-8?B?TVFadFBjUjRITDk2WTQ5dEdHYXpzWDU0Y0QzOUhvZjdNKzhsZEQvaldJbktw?=
 =?utf-8?B?VndzT3BDdEV1SUppZk9hVWxwZUFFSUxzMmtmRUQ3TExoVEJpU0YzSmVidUxX?=
 =?utf-8?B?OE5kdzhBYk9UKzFjUkM3dkluLzZaM2lwdDdWTXgzZmdpenlJQXhXd0cvQlAw?=
 =?utf-8?B?YldoL1BkczYyVTkrNlZmRzF2d2UzUjMrNCtGMHd2eWh6aGlCMExqbllxNFgw?=
 =?utf-8?B?Z3BmamhNUFpRdDJyV2U4czNTcGpRNSs5YU1mSU5GNHNISmMyak9JejBkSmVw?=
 =?utf-8?B?bGxFVUk1eUppQmRnaHZDcVlUMUIrRWpsUTc4cXowa2hiMXdRSVFTVEg0TGNJ?=
 =?utf-8?B?ZnpiVFZuM1RnRHFkcHZ0UGgxUVprbllwOXF3Q2hmUk9DcVd0YlRUTmd4LzlR?=
 =?utf-8?B?OGRUVDlqQU80UVVrajdESURiTVo1ZGFOUkpIMHo4UTRxdWRrKzRLNkVYOHFY?=
 =?utf-8?B?R0Y2SHFOSmUzUEw3dGFkMVZGTktubkJwZEg0b3h3V05xME9mRDNUYml4aUtP?=
 =?utf-8?B?Wlg4V1QyMTU0VC82V1QzRmdWRFNyYlNIdThHVCtFemFYNU5hZGc4SXhXcTBY?=
 =?utf-8?B?STd5Q3NVUXFZMnA0d3pxUWV0R2NMVGxhN2tPOEVwSHdObkFIODJpeDlBNHpi?=
 =?utf-8?B?WmJ1YUFTSmJnNE44cmMzUmhkSVZiM2MzMlZJZi8wWW9Oc1BLcXcrSm5McHpN?=
 =?utf-8?B?anVTSXJMc3lWazdZd2RHK09KOCswTzEvNUV6RmwwOVNpS1FSN3ZEL0h5NUwv?=
 =?utf-8?Q?Iwys+y/ZoGmoNtdk4M3GBjAi4oGtUhshe5WGIdg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNUQml6N1UrZzBlZDR3eWdDckxBeTl1SGloN1Naajh2VmdHbFByN2YwQXo3?=
 =?utf-8?B?ZTI5bkVZQUsvREkvWXFOS1NvSHFnR0dmSkdwZWhRUmlKTUdDN1NBTUNVZnpF?=
 =?utf-8?B?Vk41SWdyc0MwM3JEZkwyN2pBZ21IamJFMHBHRXdDa2owb2NmTVVvWUJERm41?=
 =?utf-8?B?V0k5SzBHb1dVN0xIY2J4dzR5STd2SnBhV20yMDU5WVN2YThCU2QzTWt4Yzdo?=
 =?utf-8?B?RkVYWHFlRzYvaDZ2aE42dGI4TVBubWZlN0xndGFIVFcrNUVTZEpJUHhmTW0w?=
 =?utf-8?B?TUs1Q0FqY2V4eUxNcE1WN3dwNC9yUGdwQjZxbXM2YkxVandCRU1lR1ZKV1Rp?=
 =?utf-8?B?RmhrcUM2TzRKN0EyWUUvUWtacmpzaGlhQnJHbk10WEpMUHZHcGtWUVM3c0VE?=
 =?utf-8?B?OEwrdGFjSENiTHplcGw1dm83MGtsb01ZMnRqaWVqZzlVaTBpbUpyRmc2WUlZ?=
 =?utf-8?B?dEVCVFgvckplUjUzTXpTSnhCN2EzcFd2RWowOERyNjBYUGNFem5yNnZUMEsy?=
 =?utf-8?B?NWhJWU1LMytoR1lFUGFib2xEcEVWY3FBUEpnZjZXN3ZVN21aV2xXbjV3MmxB?=
 =?utf-8?B?dXdpMXkzUUtZV2JTVVJIeERzd1o1bzFQMDZvZCtUekc2QlBxZkR6M1YwZ21J?=
 =?utf-8?B?Y3VRRkxwdDZCNk5WUkU2Zi9sNmUxYUw4NEgxaVk2Sk1OSVpvSTlmVVVvRVV5?=
 =?utf-8?B?eG03enRkWFJ0QnUwY2R3RUpSek1NclBDVmR2VEtOQncvK1R1QlJRUXM3UWp1?=
 =?utf-8?B?SGY4SDZtTUlSSVRFZnA2TDNTcCtVODRnRytlQ3h6MkRERW5kamRBL1NDcE11?=
 =?utf-8?B?c1ArY2w1MW10TG9QVk9Ka2dHNVpoN2Z3Q29XN1h0cm5ITDJuaUluRU1FSStI?=
 =?utf-8?B?eTAybjZmTVVWOGdzdE5Sa21NTXBQTDM3VE1LaERZUWhkR0hhbnJwS3drREpJ?=
 =?utf-8?B?VC8wbTRLeldIR2pkbWdjSTZsV3lMbjdESnd6dnVSWkRibEwwb2NWdzI0TnZo?=
 =?utf-8?B?UXZidXpoRHBmMGIzZmtCMTd0WTd6ZXltL0J5QU1SUkMrdUZaMUt4RmhsYmZM?=
 =?utf-8?B?QlNadkRyMDJRSWE0R1BXTTBDMSs2NTRTTStDSDFERmMzRGVTRU9FQXVUeXY2?=
 =?utf-8?B?NzN4VTBmWDJiRytHYzgzWlpwaGpwcHkzUDF5QkREOVh5M3lFMDJHNWNRcmVF?=
 =?utf-8?B?cmV4cndMM2VIdEgwa1NRUlByU21yekVRN1FtaUNON0d5YkFhdTIzcDNzRGdv?=
 =?utf-8?B?Yk02ak5ab2c5QWJtTTcxWWQ0dzRSclFtMVF0K2ovY3FFQmQzbXJuc0xKdGtj?=
 =?utf-8?B?bWl3OURUbnZqOHVQOU9NalhBa2k3ZjY2UGRDc2VFVFBRZHVqSkxpS2I2MjFZ?=
 =?utf-8?B?bWZWMXZENXlGSmJtVWRMdU5tY200Rnh3NzZCWmJHdWdBZVBIekVSb1RFZTVJ?=
 =?utf-8?B?NEJNaWpMYTQyU0VtMXZsSnUrNGtHbGkxaEluMDFxV2xxYjNMN2tUek9CS25X?=
 =?utf-8?B?bXFvcFJiUG5iMElPbXZzN3FnV2VmUnFsQTlxMUtCMTFlRitWRHZqZUJHYUZY?=
 =?utf-8?B?VVRDVXdPR2NCMkJxK2o5bHB4STVMOVBkVWdXTVE4TkhvSU9LRXJjWThJVjIw?=
 =?utf-8?B?ajVOdVdRZlh1endJVnlEL1hReDR0V3R6RmY5RDR2b2h2d204encvellsY21R?=
 =?utf-8?B?NnpyVDBXOHRRdVNxTnY2N0tJRnNlTzZoOXJCSWRpNjRPRm5sYlpnSTJqNVh5?=
 =?utf-8?B?VjN6Z2VoUkQ1MnBuYXBzaHp6S1NuSnhrcjJRekw3STAzd2x6VXJIdFBOUzhC?=
 =?utf-8?B?N3dVQm9SYXFJNS9ROUR6ZUg2Vms0K2NyRnVuS0RZekNaQ0V1YTVlRTdDODk5?=
 =?utf-8?B?bVpSbFF6a2N3bVMzU0NsVHpFQ2ZuMUdQTm41ejQyUHRlNTBoTWdTQS9vYzYy?=
 =?utf-8?B?TzM1TmI5K0Zzb2ZTbWhTNmFBN1VRcllvbDJ4dDM3dTl1dXM1WTNLeUhmR2Nj?=
 =?utf-8?B?enk3TlRtb2lGMmhnd3llNWx6MExCbWVCaitUWEtYb3JhVVNzR2lMbTZ0bis4?=
 =?utf-8?B?emRyNDFQWllwM3MwQndqS2Jwc1BoNFh4Q0RjaVZEenNxNTR2QmM4MWR0d3U5?=
 =?utf-8?Q?ZfaO55MeJMUmZ+4X3uWbgiwSZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc893da4-115e-4027-3fc9-08dcf819dff6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:01:59.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoE33xo8w5v99CrCBZzXKn2oiDNnWnJ22pUEq38Mb5krdhh/rDsnUWOCOSm7KTv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
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

Am 25.10.24 um 23:50 schrieb Michał Winiarski:
> Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
> the system firmware or the PCI subsystem itself.
>
> Add the capability ID and restore it as a part of IOV state.
>
> See PCIe r4.0, sec 9.3.7.4.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/pci/iov.c             | 29 ++++++++++++++++++++++++++++-
>   include/uapi/linux/pci_regs.h |  1 +
>   2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index aaa33e8dc4c97..6bdc9950b9787 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -7,6 +7,7 @@
>    * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
>   #include <linux/export.h>
> @@ -862,6 +863,30 @@ static void sriov_release(struct pci_dev *dev)
>   	dev->sriov = NULL;
>   }
>   
> +static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
> +{
> +	unsigned int pos, nbars, i;
> +	u32 ctrl;
> +
> +	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
> +	if (!pos)
> +		return;
> +
> +	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> +	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
> +
> +	for (i = 0; i < nbars; i++, pos += 8) {
> +		int bar_idx, size;
> +
> +		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
> +		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
> +		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
> +		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> +		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
> +		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
> +	}
> +}
> +
>   static void sriov_restore_state(struct pci_dev *dev)
>   {
>   	int i;
> @@ -1021,8 +1046,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
>    */
>   void pci_restore_iov_state(struct pci_dev *dev)
>   {
> -	if (dev->is_physfn)
> +	if (dev->is_physfn) {
> +		sriov_restore_vf_rebar_state(dev);
>   		sriov_restore_state(dev);
> +	}
>   }
>   
>   /**
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 12323b3334a9c..a0cf701c4c3af 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -740,6 +740,7 @@
>   #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
>   #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
>   #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> +#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
>   #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>   #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
>   #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */

