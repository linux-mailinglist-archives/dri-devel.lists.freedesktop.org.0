Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8902AC6837
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 13:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826A10E5F1;
	Wed, 28 May 2025 11:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yph6MJG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031210E5F1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 11:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOreIPaqOCgMsFcvRltHpRJuszhdzeYhjRqHpLWQenrCo3JfVrwsO+hthcjrQqgV/rBonJNUnPgAOsGO2gvCeI6zyk5BB7ZuLd5eH8LadtuRxPDh6acFm2/Zijulrr/oinow9j+YNdxKXDQ39V8ra0VB3Xz6CZGmP9pwpJExi8nxhPThR4Un73AJmJbsguJxnBC99GfXAKPckUbJLkyjIi4w3wfzqGDLrtLZ/wyP2wkkKysbkJtyTHvu/vNweNylZKeGZ9F1uIprPfm1j9eT1K6ysEFc9LdenfwAbKZSxQURuqY8+zWv3YePxHzGMLUB0X8oPncHvAJuIp9o1NBNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7cTRRB9F5ujzUSyghztUQVKI0hds+bqfF/WPkc1FkY=;
 b=QrebFAKHKp6zx08TwWgh0p4oAXJ+CDDxkK9Ji3TxhyezpFwTtRgBua08iHhOvBvG8DaSfwZEMbydgM0GX14zsSiTLMghJb+FV8TLXTF5zsDQTc2dSFTVjFmNXZH2yQB0B9CS7hgOubnP5gNO79MALdrbhcQEojbRwiZczsxyBD91c2+cl0BUDzwcZoflciVHPZjNNLHzXLnpTKWD2hCvcerGIbbcVfJuUBBtNIYCPgnN8b0FNvRD6XN3Ar9OzY1W35xzORbXeulo+GMfaxp7WrGSWhANYjU0p0llT1bcy2It+Pgzv/zCZdIJ/rlyQIVi0ctC8b+utzP9KUJ02l04jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7cTRRB9F5ujzUSyghztUQVKI0hds+bqfF/WPkc1FkY=;
 b=yph6MJG1L/DCZkng+na61PdF/KPQjA1F/vmOHD3iQOez7QKsAO7Godz5U+DxS4XkhARj03W1U/LKQKYbNGSZA0FvnsqSNzClgDo79ekHSxCGAKTMX5u+nvXImL1OJs+MZN5nl3JGPLYe7hwj7kJpACUAZyUtXYtlrz/XJiyA7Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 11:14:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 11:14:15 +0000
Message-ID: <b5291db4-58c6-4d19-aa22-2f49a4321a36@amd.com>
Date: Wed, 28 May 2025 13:14:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/file: add client id to drm_file_error
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dmitry.osipenko@collabora.com,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <20250528074333.1807865-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250528074333.1807865-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:208:329::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 86837b9c-9c8d-43db-baf3-08dd9dd8c844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlJhOGl4Y3pINmxSSy84aVY1U0RpOXVmOS9uclBiOUNFdnFlbU80MG85aDE1?=
 =?utf-8?B?NjNkcjVTYytVT2lZejUrTU10bjZldTNiQ09zTUVQUUZ1SHJTTTlzYUd3ZzZ0?=
 =?utf-8?B?S0JmWlVZUmRuYUkvWjVSaUNUcng5WVdYR3BQaldGcjhUeitPUFd4eHBZMkdZ?=
 =?utf-8?B?b0tMWXU3anZBZnVKZEJwdjdJdnQ3V1BFTmtiWUowVjFnNUZJYkFjNEZrSUQv?=
 =?utf-8?B?NUZ0TitsN3VEOTVFd1h2QkxlSVlvWVVkL01jTEk2clJvRitaaTBROS84N3Rx?=
 =?utf-8?B?VlRjd0EzVGxvZmhxOVorK0tmTUhMbzkwK20zLzBlamx3dXk3WGZ6V2dFRW92?=
 =?utf-8?B?TWF2a0hxNEx1ZGc3bDh4Um0zcjNwZHdpdjcvbUc4VnBxb2xtYklKdXhCc1hE?=
 =?utf-8?B?TVpRSlpJRitCOThyVFBGcGpWQWYrcVF1cnlXb29yZkpIVFRJd0RDUXB0MVla?=
 =?utf-8?B?UlRxcUtVQ2NpTVhadWNZNmJzVTFxbElzWVVzMUhiWk1uNWhUdjQ4Vm5hT2pl?=
 =?utf-8?B?aVRmdmpMcVREV0VMNlJJaE9IMTkzb2tPWnpEWG13SktoU1dRRGoxbmUrbENz?=
 =?utf-8?B?R3VNWFFIdndvRVZBVC8ydWp0ZWR2eWVtT0lxcjBBUm1qYjVURmtHUm1jOXRJ?=
 =?utf-8?B?Sk5RUDFlbUJMSDFBUDNsKzljWVlJWnUwOVdhMjZPZ2lsbnU0eTlMOStPMjdy?=
 =?utf-8?B?U2JpSWR3Smk3NlVLemhMaitONEIwYUUwcENSOUhoa0VlNnZiMHVVemxZZHQy?=
 =?utf-8?B?WjlldktUS2tjNHJWM2VVSVhCSk02VjFNdVBoK2g3aGZseW5NYXFSaXFhTWlT?=
 =?utf-8?B?NjlSMzV3V1Zpd3I3akNQVTlONFZiVEs0TXN0OElBd21xYUl6YkkwWEQ5WjNC?=
 =?utf-8?B?ejIrNXg4L0dpbzZQOXhsZllHektiR0lwbkZCUHRLdEwrMnRwVitZT3lZa215?=
 =?utf-8?B?VlhhblRudVhSY1U2Ty9mMFFiL25XUVUrZ2FDbHdTelB6c2RtVGxNczFad0tI?=
 =?utf-8?B?Ly9ENzhtTDZ1Y2V0Y0w3RWJ5N2VsTXp0NEEyUi93elpJSzB5bkhCQzQzM1Zq?=
 =?utf-8?B?cXh0cm5EWkVwMWY4TmJ4dytpSnVJWDl2TmExV3JxRXBuZGxvR1pJWmR3cG9Y?=
 =?utf-8?B?b3FSSXl1R3dJQWpWRzFVa3hIZzJ1S0habjhnQTlxaktrdEJ6Qk42dnhaSDFR?=
 =?utf-8?B?cm5UbjVGUEhDZFBCRTdBNjI2TktsMkY2RUIvTnM1VXY5ZlU3N0FNanFzOWpw?=
 =?utf-8?B?ZjdzN2hPajNycm1rYWgyaWxEUklaeGNzSnNVRHVyWmRkWkQzZGtwTTg1ejZ0?=
 =?utf-8?B?UmVsMktlYXdOZHNvVEJ5WTJxSG8xWmtQVjcyRm43M2JFMWZJaHJGQVNwcmVv?=
 =?utf-8?B?ZXZCM0dDWm0wQ1hoSnhWN2tlSUZzeU5YTHdBTlFJNm0vV0J2Si9pSmtFV2Zh?=
 =?utf-8?B?K2h1OUJiTTU0NXBELzlOSkhodUdDQjN3bmprY3U5U3VQRXNtUlBKV0tPajZQ?=
 =?utf-8?B?MldPTkI5bko0ZWxyYkFybVNzKys1c1VKVUpUY1pxcktVa1drY04ycWZWUVla?=
 =?utf-8?B?dnl4RmNycSt3aStJNldzUURWUThpcjc3cEgrQlFWdHRLL2FYaXoxMHpmZnAw?=
 =?utf-8?B?c0JsTGU0RFVUQjBDV3prSjRIakRkZGplSzFZTE9ySThGL3hjSWFjVlBTNCt1?=
 =?utf-8?B?cnlhL3VJZHE0cnNmUVVTYThQNU4wK1RsVGdrelJ6bnU1UTU0cWRKVkxTY0Rh?=
 =?utf-8?B?Ui9Mazd0T0NsRDlmY1pjK2hOUkxTYnAxUW5IbkNQV0kxMXJTY250QnhzUW9J?=
 =?utf-8?B?RURPeGVaUzVUWVZpTStsYndpekZ3S1Nzemd3QmdOdEFyVk1ibHlBRElEL0M3?=
 =?utf-8?B?Z0pDMnlnOHoxMmVsL2NMT1hkck83ZHQvWFoyNVkvSjZDL1poVGh3WlVESU1Z?=
 =?utf-8?Q?K8hbOfZ6/pw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVJLR0c1MzcwWHVKdkpqaVJaR3ZQNTJDWmNYLzBTa3VYaXJuMEVkQjZZbFBt?=
 =?utf-8?B?ajlGd0NwcUpJcjFxVlR6ZVhGNU5CRDVwTnRFMVFTRHc3OGtpZTF4dGtkMU5K?=
 =?utf-8?B?ckM1ZzdwaDh4U3J4L2xabmpyZkFxbmVYem5ZeHI2cVlUZjlGTGZlS3lKeFg4?=
 =?utf-8?B?UUZyMURuWUxyK1FmOGJHbEdsdFhPVUFFcDQzRFFWRHBTN1Rnd0UvcmszU1lz?=
 =?utf-8?B?Z0MrVWQ1a2lDOWdwRHBGcjd1azg1Ny9SWlFnaWZsdll6OXBIZEVyMENudXIv?=
 =?utf-8?B?TkRDZmt1S08rQWhBU1ZxNE51RUVJR2w0Uy9hb08zK0hoOG1QTkEwMHQ0c0Fy?=
 =?utf-8?B?T2hmV2Q4bDdFdng2Yll4NXVzaXZsMXNWVU5CSmRpd1RicjdxdzB4RDhXdEZ5?=
 =?utf-8?B?TkJKWTZnc1dWNjVmaTM0cHRjRVJvOFdxR1IvMTFCdUJlMW91bmVDYUlGWHli?=
 =?utf-8?B?UGl5RG10RC9OYjY4dVFtTzRIdXlpamhaUlVVUDVnZjgwazBjTEJjUVBzK0tr?=
 =?utf-8?B?UHNiZTdSblplZ1Z6WFJ1NlRyN1BJTEhlWjlmUTZlT2cxMTFGYTZ0MXFUUXdO?=
 =?utf-8?B?VmY0RVZKUjRGWVB4NUw0MTA2VEU3Uy9OUjVSVm1wbzRVdlNDbzI4cGgvL2s2?=
 =?utf-8?B?VU0yTFN0eHp4blU4Y1J6eDBPNHZZaEtlSjVvTDdMb1B2SG1oMTNxMEJOT1RR?=
 =?utf-8?B?eG9UbU05RWJOM0JObFlteFlDQk9TOWRsWWJFWU9HZXI3VndreFBQSnFwSVpT?=
 =?utf-8?B?RFBlRWd1MlYvMkRPajNTRDk5R1VNRVFUNkNUcUErNy9KUGRsbzlNb0cyUjRq?=
 =?utf-8?B?K0xwdkhjd3loR0Erb2dQamVqMXRmLzhQTXNMNUNScFZhM0pXUWFhSldtR21z?=
 =?utf-8?B?ZjJEUEdHY1BiRDJHeHdDSUk4NjdKQXBpZGVaRW5pS2p6cTA1Y0V4aFRhWmJL?=
 =?utf-8?B?d2cyQ3B6eUZzd1Q4M1pzdW1ZZGZSbEU5TWhITFB6SExiZHVVbXhnaTNOblJJ?=
 =?utf-8?B?ck92aXFDRVpPSnZ5dVB1MEc5WU1pTTdRMGw0ZldBbzdVODFFUTVBb0w5SFZi?=
 =?utf-8?B?UnNTVDJxY0lzQk5OK3RhT1B5NGx4eW9EdVozT2piVXdVRlBNL2s3VE5QYUl3?=
 =?utf-8?B?c3JXK2F1NU9nWXNLNHVZbTF1U0NZTlJraEJHYk94bmhPMHlJenNpYVRDd3B4?=
 =?utf-8?B?aTVPdlQwWmJ0YzBRVUNzcGE0TTA4MFQ4LzdvSkc1SXl1c1hGaGpidUlZKzF4?=
 =?utf-8?B?eEp0aTRVRWV0L1M5RjRFRVFHcHhLeWN4UXN6Qkt5OEZDRTA3OVNOU3hGUUtL?=
 =?utf-8?B?d2w1MnRWbk1uWksvdVdJSTltcFJta2wzelBTM1czOGw1dkZ0QzhKZmV1c2J6?=
 =?utf-8?B?VmtIUnE1M1VZSGRhYmF4eVdVZDBXR3RZSlpyalhKdGE4TXpaVk40QlZIbXor?=
 =?utf-8?B?cWtLWXE4ZE5ETXlKNS9LSVJMYWNnWWdDaGtKS2NCNjNVeU5Kd2JEZFdGQ3JY?=
 =?utf-8?B?azgwOHlpc3oyZ0pMUkROQUhEYUJkaHhVTWt5dnRJZWRRVUYxbkJMN1RrODdV?=
 =?utf-8?B?UDBLMnlpS0Y2T1Rib3V6WkkrZDNOczk3V095VDZuTHpzTjBZTHdvSlluYWFo?=
 =?utf-8?B?dzZVa0NtaUlLRDgyNS9aLzRMSEhnNUVBdHg4YnVJcDVqRHg3R3lCMEhUemNw?=
 =?utf-8?B?T0kyZTJOTFhBZFBCQTBBVy9BK2IzbG9raVIrQzcvZTZTcndSaWdiWW5Saktl?=
 =?utf-8?B?a1pvZURLdHg4SDkxZDZDUTEwbnpZemdlU2hPdkhGY3UvdjZEamcvS0szU0I0?=
 =?utf-8?B?NDlZM2ErWXBBMnVlOS9Qdmx4ZjRSKyt4T2FoVTh0U0lVcm1CYkx6em9kbC8w?=
 =?utf-8?B?Wk1RWUlVS2dyU2YyZHNVR3k1RDNwSGVXNE1HWXVFb3liVUNsSTY2aDR4VlFQ?=
 =?utf-8?B?cXRVQzMxVTQyZFNwaGZOd2s2VCs3aGpBVXlUSEJWdndybkxGTmpvUTJoazU1?=
 =?utf-8?B?N3hFcnVhQUFQTG5ocUNZb0ZENFAyVExOaWJINXFJTkg1TVdWMVFEMmVOTy9G?=
 =?utf-8?B?KzVLdjBoOVVyMVplTG02Mm1VbmJUQ09SMDk4TndzNjhRcWU0Y0lueXA0RUtX?=
 =?utf-8?Q?MlSh0dVYMsaSSAyrJqUfQpa0w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86837b9c-9c8d-43db-baf3-08dd9dd8c844
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 11:14:15.7771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Mt3c0mKt/yr5DBLJuOOz2FDZO+acIP4lKEL/i0Pjos0K6LU0/WDklafKOMokvXA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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

On 5/28/25 09:43, Sunil Khatri wrote:
> Add client id to the drm_file_error api, client id
> is a unique id for each drm fd and is quite useful
> for debugging.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index dd351f601acd..2f6c0ebe0850 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -1011,8 +1011,10 @@ void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>  	pid = rcu_dereference(file_priv->pid);
>  	task = pid_task(pid, PIDTYPE_TGID);
>  
> -	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
> -		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
> +	drm_err(dev, "comm: %s pid: %d client: %s client-id:%llu ... %pV",
> +		task ? task->comm : "Unset",
> +		task ? task->pid : 0, file_priv->client_name ?: "Unset",
> +		file_priv->client_id, &vaf);

Same comment as with the debugfs patch, client-id first and then name I would say.

Apart from that looks good to me.

Regards,
Christian.

>  
>  	va_end(args);
>  	rcu_read_unlock();

