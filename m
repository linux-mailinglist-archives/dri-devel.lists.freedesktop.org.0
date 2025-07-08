Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1EAFC86A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4E110E03C;
	Tue,  8 Jul 2025 10:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hmeycYPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419E310E03C;
 Tue,  8 Jul 2025 10:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frerjPHRgLrWqJVo5n044bU9ByAmpGjBQWXlowDDZhDN1oqk7cyM83gYd2+epejBcl9mpgCYS2IOCqsA8pYaTJ4rQPWB13AEKShwqzkeSbQpPsoVUWKjNb45zMKi1F5p/+77SMun2ovrTm+EYx5J1FqEDFsLJA7jzPYYQpWbkZosbjy2cYLBzITAsQjw2Urpje+rvXXnuza2TmPJ/z1FWQKszFWPm9E/v7Xw1vAU2viWBg9WayiYwalKRN3lFhb/urUg2nnOyCyeyynmfU61XFUSmwd+3IYBdZuF7JTg/A2SfBBXxVR1H4RoKaLn49DIzb8iQRjptg+HJNkYwERGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zotf0EK6yWLySb7Nk1SL6XegPXcApvwlsq2UjuYj0c=;
 b=ufRQSA4XehsqWnEC37T6btI+jkWaQVCNZ5P/v6hA9yHwaKFxcR2yb/LnvtyfAieM/+5jHdeVHTkpKPCYGACQiYS4VyL/OaWL2ROozoSHup5InIVYDqwUy9tAddt9NyScAIru7ixGrwJcZIYMdzDwvADM7CbTMXQ8/6WNdVNCNdUqCoDJWIV6TGV5ekF3cxqXo+tRBZs0U2PCDQtp1rD2TpW8ca0NycLjYs0Jw0YC6fFsVuoCeDV31lraAtHc2NN6oSGqjCtLUrNBBiWAOVO6ulCDFV9QsXkI/NQXctbbV+MeGkfEPi7ZcCrJRZ2VBXxiFQTVZpvG0zJSvAFV3guRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zotf0EK6yWLySb7Nk1SL6XegPXcApvwlsq2UjuYj0c=;
 b=hmeycYPgJ2QuQeRSxrX74cmb9GiF2BDHAqnTvtHiGR4Yzljo8AYdIA7EPoC+aF2NFd6tMLTgxzaVXwrhzt/LrhD3UXpaZV7tSq12Z9m83S1KtEj+ojnmfV+vb1AskpMlkpNC/2qcfpdmgWs88MAeB8mV3/vfPwdJRugCOY5s5O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 10:28:52 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Tue, 8 Jul 2025
 10:28:52 +0000
Message-ID: <ea7d5c44-2287-495e-9046-997729b99220@amd.com>
Date: Tue, 8 Jul 2025 15:58:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20250708074248.1674924-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::7) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e62478-ef0f-46c1-e63f-08ddbe0a3bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THcxRHJCdXJVSlk0VTd0VzA4ZjBNYndUZHdwdWJWTU9oYk54eWEzdGRPejdL?=
 =?utf-8?B?eVJOdDFmQ0RvTjRHM3MyNkxYalRJVDBnOGJQdnVTTkpJN1Jsb0Q3bzZxMFlz?=
 =?utf-8?B?RG1JQ1IxVUZLVnVnRzh4ZzBxNEVVNTB2Y0pvVTYzbC92SjFpWjZNVGRVeHJI?=
 =?utf-8?B?RVh0NXVIOXEzSWcxcEIxb0NDUS9HOVhmUlNRZHBRZk9vdTQvVW56dmhRVDl3?=
 =?utf-8?B?S01XbmlYSWNhNmtHakVkRG4vT1pJTTlpSG1DZjFPdlJCZTJ2N3dhNnhMRUEx?=
 =?utf-8?B?dkZJM0tEL2NTN2JXOWgwckFzZFEvMXdSVnRFUUdLTjF1S2RBUmNOMUtNci9z?=
 =?utf-8?B?dEhWSTRvbnE0RUhKNDRaaEs2cmkyRTZUWkEvNjRkZ1VmQ1JGeXF0ZTgwOHJI?=
 =?utf-8?B?aW5WY0FaRFVqUXNwKzYrRjdJZ2h6SEYxdXZNNmJ5SUNoby9yNENsK1pLV3JL?=
 =?utf-8?B?NWxZVXh2NnNjMDBuY29SWGVvQlI3ZUtVQTUrbVlKQmJHYUVJY05UNjVhVUVV?=
 =?utf-8?B?MjZ3TUpiVHlYd3pZV0ZWWHVyNGdPcHF4Z1dQMG5qYjljY3RZT3VZcVlkOUtJ?=
 =?utf-8?B?SDBra1BpR0pxRk91ZDRYVjROOXJGQXU4YkIwRmM2MnVOSVFGRFdxd00zSzYv?=
 =?utf-8?B?QWxRWjZtazMvcUhhUm02WTN5Y3JXZEF6Z3BpQTJWNjdtdDhZM2RmbEhTRFRY?=
 =?utf-8?B?L1ZnNEFncjFGUTBER3I5NFZKZk0xTmNRMTQybk5jM1prVVcyVWg1NTZzVlJx?=
 =?utf-8?B?aGlob1JrYWcvVHlMTTNybUZiWWYyMDgxdjc2OGRrTHBsTGVveU1kNXgzbm1u?=
 =?utf-8?B?VjBCZE0rRC9SUEhueEpXYm9NNDg0dmVSN2JFdE1UWjUrMVN2WkRCcDB1SFky?=
 =?utf-8?B?RTMxeG0vd3FEZ0ZoZjF2N1VrVWIwdVpEOUluRVV4WCtuaG1yb3pNYUdwMGZ6?=
 =?utf-8?B?YkEyZmZBNWtmTVFFcExwbGdzQjQ4KzlBNVhOL285TDlGcWtoSnJ2ZE5JamRG?=
 =?utf-8?B?dEpZa1UwbVFhb3hKMjJmK2hmUGFRZWlWQ3EzVUZGY3NmZjY4ZStSUXhuUHNk?=
 =?utf-8?B?bTNLUGdrUmM1WDdlMzNwV1NNam1od2xxVnF5RzdQdE1qajN6c0psVjNkbi9M?=
 =?utf-8?B?bS9OR3A4K2lxejF2VU5yTWRqditabitKQVNVZFNzOVZWeXpmc2xFcWlnZE02?=
 =?utf-8?B?UHJtK2FuSjlSS0J4bGxXdEltaFYwS0FmeFhPK3lBUlpXT1BxY0dEdTNON0RL?=
 =?utf-8?B?MzVuTEtBQVBLWUZYQWhIaVUrUitkamNiU1h1aHBIRUxLa1RVYW9RcGZPaHJT?=
 =?utf-8?B?VTBBd1ozNFJIZXBHdis4NU5hOElENW0xL2J3SFN2U0hIekFaeVU4Umh4UUlp?=
 =?utf-8?B?WnFWaHFtNStURzRyU1gvV0xzSkR4cFJLQ1RYUklManB5N25lVVFsUkRscDBs?=
 =?utf-8?B?N3c0NmVWTEN1UHdjaFlSQ2M2RHFTTkJqd0l3cjVuVHdWK21nakJMU2dvcG83?=
 =?utf-8?B?bWdHcmp6K1g2ZkRldk5FV2dvR0FHY1JORElWMGZ4R1F5TmVLZXpxMWJKSGhQ?=
 =?utf-8?B?RHZWSWEya21EVWxONzIrV3ZqT0drYmQ4K2Z1Y3FINkJvMGM2Q3pUdmcza2U5?=
 =?utf-8?B?SmJaK2QxNlBaMUdGejZCbjRobjhheXRSRW9sNFR4bmVSMG5OWHVIR0Y0M25X?=
 =?utf-8?B?L0dPb0s1blNtOFZjcjF1Ry9aOUJzZHNRWUI0QnpXajhBdW92Q0Z2N1pWc0Rh?=
 =?utf-8?B?M0NpMTY4Z21DVlhVNlhreUJjbnhwcUxkVlM3MkYyaGZlRWdHK25XeTRxNnBF?=
 =?utf-8?B?RUlSdm1YWXBHeFpTb2ZoTVVmYkVOU0JoSk5UZXJLbUhNOW44T1pnWE4rRzg4?=
 =?utf-8?B?Z3NOSEFUMkhsQzUwRU0yUzRRUklRdVZhNi9CN3V5blE0VmZ1a1NKY1RKb1Mx?=
 =?utf-8?B?ODhEWE5IR2ZsOXB1c3I3YWhqOWNDSGdLcTRwbmk4eFlqS0p0azdoeU80U25z?=
 =?utf-8?B?OGswT3ZIQ2FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1lSNldxLzVNQVc1NmtpV216U3Y4WXdpZlpIbDRteWZVem1PdnJVaWVmZlRY?=
 =?utf-8?B?VE8xL01PaWNrVmRkeVFIZnJXL3ZvS3U3OXdjaVEySURCdHFUL3Jqa0FKWmJ6?=
 =?utf-8?B?UUtjSVRiNVdPV0U0UjFXY2tlL1ZTNXdkN3U1TEVPVWhYTWR6ZXZ1dXdrVDZh?=
 =?utf-8?B?WU1BeHVrdDBHaW9TTnRRdUd0MUJybzcvYkN6UUJ5UWdhMGt0dTE1Y0xZeFZW?=
 =?utf-8?B?S0dTd3BYYkZOelMvUHNCREVOdGNnUHMvT21vdVhpaWlqejBXMFhzYXZsVHVM?=
 =?utf-8?B?YURsTVVqWG5FTUxCY1ZUR21jL2lMN0ZOSzUvSm0vRTJMRDJRbllHVXZ0ZzdS?=
 =?utf-8?B?SmpzKzNJN051WkFqUGNGVVFMV2IrTU12YkhTNVdRT3FpeXFhZFNhaVVwTVdN?=
 =?utf-8?B?bU1QUnB4VUloOUdOaExHNUpCOHVQRER6ZUkzck1Vb0FTTGtmVzN2MWR0MDFW?=
 =?utf-8?B?cWloMmkreWNQbERQcmk4b3RGbFNabU5SS3lsNURRb0p3OWUxaDlqZmhNOWhC?=
 =?utf-8?B?dEk5ZGU2elRxV2hZa0FTNDY5dHhDQWIzK2VOZFJKdHpPWi9NMDViUXc3dGQr?=
 =?utf-8?B?alNPNU50Y21JVWtldVVRaGhXNWRuLzFIaWhOb0dPN0JsenFra00wdWtFcHov?=
 =?utf-8?B?ODhnczAvMnBWbzRITDZaR0toR0FjdUU3VUZGNDRLc2VDajU2SSt0NjVYNTdj?=
 =?utf-8?B?bGJjbWEvVFIyS0NhN1NuRXQ2cDRIeEl1cVZaZ3QvQnIrbzN1aUJuY2xzYWFW?=
 =?utf-8?B?QkNqZExLMC9DaTVjLzJ2Ry91QlBhV1YzRW9GdnBmWDUzV2E1aU9OelFnZXVF?=
 =?utf-8?B?bFc2dzJVZDlvdncxRWFQTVJKZkdnM3UycmVicDRuWUtpVTN6ZXJRQ2lsWlIy?=
 =?utf-8?B?dzBJSk4zMVBxQUxQekxNbCtTVmk5QmF2aEhGWFBmMkltazM0Y3QxMTV0Mnc1?=
 =?utf-8?B?K25sUm44ME1tais3RGFJc3ZwcEFGZ3dTQkQ2NmpMMXhiTkt0MDJYUDhINkRm?=
 =?utf-8?B?MGR0Wmg4aHk0MTdaRDlDSVZMRS9yM2o4TUc5bExIbkJhQnpiclRmR0o2QlRl?=
 =?utf-8?B?NFN3cnVXdXZ4bkt4L1Qyb0FFZ1JNWDR6eXBlczl3YVdJdkJYN1FleVFHcEN4?=
 =?utf-8?B?VmhFTEc3cHY4cEtYQVBoVmxicFNzRDZFK2RpNnVqQm0vMEZyYmFrNzVsZjhs?=
 =?utf-8?B?ZGJkZXBQR3laODljYlZ1QXZYSkJ3aWlzTHlUNnVHbjVaY3YyUzd4N2xXRk11?=
 =?utf-8?B?QWR6NzJ3WC8zV0ljV083K05pZ2xZNTRtQmE5UWhocXpSV1NpRjh6OW13NGE2?=
 =?utf-8?B?b3Q5enVVaGZrWG1peGJ6cjRyaTFVM3A1WDArdDFmNXpzSHZwZnRuaWtpaDJX?=
 =?utf-8?B?aW9lVjhtYW9IY0wrTXB6VmVXWXpoWXlOVzRJejQrR3JydlJoVGZZTitkZFU4?=
 =?utf-8?B?NkJtb0E3ME5lTEtEWGMweFdpYjJLNUVXRnJsOWFUR283M2tNMm5qc3NURGp4?=
 =?utf-8?B?dkprbFpVcVJtL2RFenkyVG94cjRTY0MySExTUjlmamUxZnhQakpCT0QwZTRH?=
 =?utf-8?B?QlU4Q3VJTVBZS1BLNWE3RU1OTFJZdFVxa05TK1BwK1pIUFRrb3MxMDhTUWJy?=
 =?utf-8?B?RnBnOXRoTUsvNFhzOWpSS1VYSzU5Z2RCTTNmb0xyRUcxY003QUl1V0FZeHM3?=
 =?utf-8?B?UTZWOUJNSW5vSDh4bUpoRGF3Zk5lU2ZFZ25YdVJJdU51SEtKSEFiZ2RqaEpQ?=
 =?utf-8?B?MG5lUmxOTHd0b1dONi9pcGVVYUtQODJVMHVpNi8vVlV6VWJYRDhZTmRrMkI4?=
 =?utf-8?B?cXV3UmgvdnlHMzNDMFBmQlEvRE9GZ1RRWHlVd2pETEdNZHVZVlQ0Z2NlbllQ?=
 =?utf-8?B?NjJab3JBZDdkdG50YkxrRGI2UzVHa3lXdy9QZ1dnRmpQL3ZKeWk0ZG41MC9D?=
 =?utf-8?B?VjB1QmV5Y0V0Tmgvd01jZWpiTmZYTFlwYlZPRlFUaXR6VWJ5ZUxsUmpmcFIw?=
 =?utf-8?B?V3cwcU5aNGcwZklrNTk5c0gzeGVDM2tuN2pKRXQveFdTcUhUZ3JpOHRvYVdN?=
 =?utf-8?B?cWY3amdrVlFwempSS2ljVGt6bThqKzBHejNTUUZiQ1ZZVWM2OVJiaG9vMWR2?=
 =?utf-8?Q?pg9Jo2J6jDzvyvmEt0j0ZwIwI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e62478-ef0f-46c1-e63f-08ddbe0a3bfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:28:52.7571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOQ+OxcBGiRBik/MA7RhZngNSYOSPuMfPp0ZtodNmsrM70TxsL19d38nNleNvbbB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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



On 7/8/2025 1:12 PM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
> 
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4f8632737574..10827becf855 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>  	if (amdgpu_ras_intr_triggered())
>  		return;
>  
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>  	/* if we are running in a VM, make sure the device
>  	 * torn down properly on reboot/shutdown.
>  	 * unfortunately we can't detect certain
> @@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device *dev)
>  static int amdgpu_pmops_thaw(struct device *dev)
>  {
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	int event = pm_transition_event();
>  
> -	return amdgpu_device_resume(drm_dev, true);
> +	switch (event) {
> +	case PM_EVENT_THAW: /* normal case */
> +		return 0;
> +	case PM_EVENT_RECOVER: /* error case */
> +		return amdgpu_device_resume(drm_dev, true);
> +	default:
> +		pr_err("unknown pm_transition_event %d\n", event);

If it ever happens, keeping a bit more context with 'dev_err' helps -
"unknown pm transition event during thaw %d"

With that -

	Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> +		return -EOPNOTSUPP;
> +	}
>  }
>  
>  static int amdgpu_pmops_poweroff(struct device *dev)

