Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DAB40628
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36FD10E741;
	Tue,  2 Sep 2025 14:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ltB2nbAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27E310E741
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TURrtL1vQH8MgvsWA3mDUN9A6Vn9uq6ows0Eh9cK4+FMdH+GlsG5ALZPrbcQ1f/hfVf0ssf5mtBahv1/6xx9+5Z/1K132ujSbqMQRtzZRv7RHNFkf4fQpvT+yY+5GYOZXf0OEOUUFYuedP8LmB679E231JluImonHrBcjCRVo+HN7YCvUNlp9hDaP1fsE1MnnpAnjlv+HAl0VSRGaN8y1G74v0j7dqIiITs456qxC5muTyZplH0aFBbyZ3DM5e84WIw2UYrnCV+nf+ncIMCs3i+U6CMFMy3uQnR1Lk5Yl/YNaJGLAImrHc+6MEfYmPtBb4HkbATbO+Z66jXxUXV4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jw0rKOTR/qJa29F7yyhPZ7sutZEY3iqAeCQpK/sNYY=;
 b=sLCW6Ju+9+cN10bhLX6gh5ViKU/LIsTpWOYF01bCp/9Grvg7lWknMMvXYgnNxAjhq+8EJddDPjyMfEK0LGVs+A1abU1qWPGCE9RQGCK4OhRE4AQQtwUHQ/fk7JJ/5EGz8ByC4I7Zp2+1zIbqOGPRAmM3RjA/Z8m16Dz/SBZb2c8SvG8JWj8lNdorS4KtxxhfJ/5bYHEirwFHb2BUL+wkcKwMr2vJgLTVvWHz+ttSKOvJaCZiNlZgo0NnD4/5cNO7WvvAdfDGkyWE2zCFAQCHFnTwlas5FLnsIv7w1JAMS1ZVwy28CyN++AmHD5C0xDCZ1EFjEPenVHnCJlTfJhOMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jw0rKOTR/qJa29F7yyhPZ7sutZEY3iqAeCQpK/sNYY=;
 b=ltB2nbANMp/ix/spItAm3zx13ZpVSUNkCkGIBQMsJwQWC4e1VOEHgIDXV4wCHfMUe2DTvSTjwHcGtMSTEFd3Bo8R86G573hGKu7t2kTg1W4BET4UisgfNVnZVe0ZxibdjW87YpGh2cCpKcMgIIzcyni5dH8SvefU0PViL1EMGSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7445.namprd12.prod.outlook.com (2603:10b6:510:217::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:07:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 14:07:30 +0000
Message-ID: <e1507242-952c-4131-93e1-6af52760b283@amd.com>
Date: Tue, 2 Sep 2025 16:07:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] ttm/pool: initialise the shrinker earlier
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-10-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902041024.2040450-10-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb54635-9b5f-44c7-d9b4-08ddea2a0df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REhLWmRSRlNqNWxETUdSSGRweHJmVDhGdmJYN1ZpMmtlU1RlRXZlOEpxSmZZ?=
 =?utf-8?B?TWd0QnZkbFJ5ZERqeDdRTTZaaFdBNnc3NW5GcnliV2ViektZMGMwaU1kTnZO?=
 =?utf-8?B?R0pjTGIyODAzUEowSXJQSTZhOEdQV2lPcEs0OVBUM2o2Z2JXQW5SV1MxNDla?=
 =?utf-8?B?KzNmSFJhR2N2MGtveTN2Y2w2SkswM24zLytSNk1VVGg5ajFjQlVEcTJpMmp6?=
 =?utf-8?B?VFAzdDJ1cmVzd21HWTFQOW1XNlJETmJVK2xRbmwyL0tFaTVQWmRPejdWVzdZ?=
 =?utf-8?B?SjMwdUN0U0hwbnhwQjBJKy9Wc2tsYjJuZW9sTmdZSTVuZ0FSMVdCVW1pYSsv?=
 =?utf-8?B?VEdmMkRaWDZybTFRWDdaUlUwcFE3TmttSkVrUzN5OThWd2tmVnhnOU5UaERW?=
 =?utf-8?B?K2I3MHE0NkFkc0d5d1ZxRFhHRUxIeCs3d0x3M1ZzQ3ZWTWtXeE5MZ2NzeXkr?=
 =?utf-8?B?aEJEM25mUWd6T3huRVVJZkhQL1hLSzN0cVhmVjVneTlIOCt6NzZYSERlbGZZ?=
 =?utf-8?B?KzJnbzhoL1czcVRGVEdOblphTjN1TGw0NW1ka1hOMWpITWJINjhrbXgvOVpS?=
 =?utf-8?B?ZDNHK1lXNTVZWE9TOTk2b0h4bWV4RDRsTHdzbURGQTZjSDdjZitqUDZzTWRV?=
 =?utf-8?B?Zkw0RTBrVzFZS3U0bEJpWEtRRDB5TldXSXFOL0psKzFmakh3Ukt5MzFzNU5t?=
 =?utf-8?B?SHcwdm5QQWlTY0VkMnlkODlMS2c1UkgxREtUMENCRHdVOXR5ZUpVSlBZeGFH?=
 =?utf-8?B?OXZFUTNsZWN3a2RFSHJwMUs5NFEvTkh4RlFsQzFqS3U3eCtsdUpqZVAwSWRs?=
 =?utf-8?B?RkNXWGpMWlFhb1lIZmlXWldiZ0pvT2xqQ0I2akwzcXp4YS9Jcy9SeGdCZ2Nr?=
 =?utf-8?B?OHFsZW1iOHdxL21BQ3A1K1pNd0hGWUEwdDNHTWpUZkNKcmFjeGU0NFM1Tm5a?=
 =?utf-8?B?c2VhdGZCd2hoUDdZS09UQll0eitSNlJBVzRYRS9FVkdmRWl0MFhtNEUrTnVJ?=
 =?utf-8?B?MzM4UTcvdDFra1JEeUwzeENyRW1Qd014U2kzRk0xdGFsVDVtUTRMNzd0djJM?=
 =?utf-8?B?QU9ueVNYWkViMUlDNkNRdlg1MEQyaXVsc2YxR2ZEZm5WT2ZWdTdhbzFnWFI3?=
 =?utf-8?B?SjlNak5RNHlER2JORXkvTWJoMU9ZWEJmNGlPaXhMTHpOYzRaYUZjWENlTito?=
 =?utf-8?B?V2oxVVNFQXdJdXFiRjBJU3c2eEFMK09ZVzlaTjdwdGRGOEhDajJOelpSTXBR?=
 =?utf-8?B?ak9EN2c4R3BpT0VCN1o5Qm9MamlueElxaHA4QUdoTEhKM0IvTHNPZCtubWNy?=
 =?utf-8?B?MVBGZWdkMEhjRWE0T0V1enVjbVNpWWZFVzB5RVpIUVYrZ3NKYkJmTWNNbHNG?=
 =?utf-8?B?SFg0TXpsOWJOaTNFMlNHRy9tS0tYK3RXSFNBYi9CT0trY0ZQMjBvanFxWm1M?=
 =?utf-8?B?UlVFTU9Fc25wWW1la2FYdHVMdExtdnFUQ3J4OE1XWWg0amE1NkxkQjcwNTNw?=
 =?utf-8?B?U0Y5Yk80K1pUV0dOdktYTGdZL0Z2WkpGMU90UzJ2OHV0QzNHMFlxZEJHOW96?=
 =?utf-8?B?MVNBUnE4aGR3WU9KWDBEcEoxMkx4VHBQNk1PMVBoK0N4aFA4UUVFeGQvRnJs?=
 =?utf-8?B?QnE2RnN3R3ZNK3o1djZhbzJKSTM2b050RHZiMWFlbGV5ODZKY1NmMXdhcDRM?=
 =?utf-8?B?MFQ4ZDN2VG1IV0hBK1F4UmJmVEMyQ04vUE1SNVdaeEpseloyRStiMDZuWTVW?=
 =?utf-8?B?bUo3V29ZSjh3eFlXSkVIMk14dUo2ZXBBWFFlRUVoaDVsSXJ4bnBqMFZ6Ykwy?=
 =?utf-8?B?ZUNiY0NpUEdGZDVQV2VoeUY3MXREMzh6ZE42eWF0Vk5nL0Z0TERsWWNGQ0FV?=
 =?utf-8?B?ZlVuaGxQK053WFZKWkF5V0pFOW9hVGYzYXV1b0lOaVVyeHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkExb0t3c2F4a3llVWZnZWpONjBuWnF4bTIwVHF5SXVMZWJLWGprTVpSajhV?=
 =?utf-8?B?VGJXSG01S0ZlNkdxUDIvaGhZb2xrR2diRjZuTlgxalI0b1RhZlpkQVl1Kzdh?=
 =?utf-8?B?dkZvNTI5Rmxhbm9MT0VLYjNoU29HVmhwOUxIRHJwK0dmQ0ZXcThlS2thWkY2?=
 =?utf-8?B?NXJoZ091dzg0VTVzL2NnWWJGNlgyNjgzck51Y1RWK2NxMUZkbUllQVNHVDJh?=
 =?utf-8?B?N0h5OFMwMFBqclhwblQyYjFSVUdMVW1HUStCUHZZYlZWK1UvcnAzdi9YUVNJ?=
 =?utf-8?B?SWhEMUJGd0k5MXpGaytVMkJlOVpPYWsvYm5PT2VyU3BaQzJycGRoZU5CbWxa?=
 =?utf-8?B?SnpVWExyTXJFemZ0Y0l0MzYwUXpTY25qN2hNRFBoaEIrOEQ4RFpMWlFvSFlu?=
 =?utf-8?B?am15Ri9nc2pNczhKeGVrb212SnpzU1dEK2xUYURiSDRJeThMK3pvS29yR1Ji?=
 =?utf-8?B?KzdwNkNLTzBuYTZhTUxJZ0w4bVdIZlBPZ0hFeGtLdG1JbU1iallON2dHWE1p?=
 =?utf-8?B?bnZFUEdXZWxkbWR5aUdBMXlIN04xVVJUck9RaHFicFRGU05sSlk5S0dXbndW?=
 =?utf-8?B?NS9pcGRwQm8rMUVuZFhKUE1vYS9Vd1k3Q2pmaWpRN1g5SmowYmVDRWRQRVpn?=
 =?utf-8?B?aXdIdHN4N2xncEo3TUN0YXhHaHBDNEcyUFRScWJPQnBPTGV4OERpNDMvTmg0?=
 =?utf-8?B?WVVtWkV4anVCR29OUFI1SGgyZWZXVytKODBQcENENUg5VFlHQkhpc0R3OTdt?=
 =?utf-8?B?YThLODVSWnFKc0dlZ2o2aHZDT0diY0VhVDBmWjFuQ204U3ZJVzZORUxKL1Jo?=
 =?utf-8?B?eFA0TlNuWE9Lb1pmNTR4U2lHdjRheVNDOS85MmdXb2htdTZLV1ZSRUJ3OTBC?=
 =?utf-8?B?WEhKc24rVGdueVJ6Y0FxRHlCMUlFWTZKMG85Vk1BZXI0ZVhKcU1pcEYxS01a?=
 =?utf-8?B?OTFSNXdJamYvM0JUd3NSVHF6SHJ2SXloSFk2KzF5bFllVUlPNENwTGpPYWxs?=
 =?utf-8?B?ZStPTStRYjA5OVVQWHBuNTcyak9WQnlnMVpNTExBaGwzMkFMWXM4NFBSWkJJ?=
 =?utf-8?B?cmVNaUEzc3BmMytXdmhPUkowQzM2QTZyOVhDQzdSZ0VZN3BjbjRxaG9DZ1p1?=
 =?utf-8?B?aGM1T0doZGJtc0tqOHowdnlvK09HUFBLTWg5YUI5TW4za1JwMEl1WkpXa3Nu?=
 =?utf-8?B?SzRRZFQrVHBEV3ZrSVh6QXhjeFhuT0hMWWdQdFJkUmYzNzlEN1Y1RVI3NGsw?=
 =?utf-8?B?czVNU2o0SjVIbndLbWgxb1hOaWNCcWV0RERyRHlPODYvQTJRT2lZU083VE1h?=
 =?utf-8?B?aHJrRTF4ZTJ0WkFqSUdBTUM4OFI0VUN6REQxdUJrU2dITDVOMWFtWW43a3BD?=
 =?utf-8?B?cThoOGpaNkhOK0lnaDdwOGZmUVh4VDFjak40dmRNY1ZJbGlBb3V0cFlJcDZH?=
 =?utf-8?B?d2pMMkRrSFRWMHNTRGF3dWVWZlB5cmFHRlBEaU4yUTZtbC9zckkvc2tFUmtX?=
 =?utf-8?B?TXJOV2lFYWlSZkJhQWIyTGpVWXJPR0MyYTlBZUxIWllRLy9VQjRKcmY0L0hC?=
 =?utf-8?B?RXFNY1Y3UjJhQVZRaCtvWFY4dDVnU2daZlpkL3ZtRDhTY3JIbVF3eXBnUWNv?=
 =?utf-8?B?bkdncXVmRllHTHNjWkI5Wmk1SmhhaXBrWkVxZmV0dlZhenFpRDEzYUpKbjZz?=
 =?utf-8?B?UDV3a0thS3lzSjV6Z2RINmxvc3k3Nkh0ODBneXZWcE1xUGlnc0xndkhodGFt?=
 =?utf-8?B?QVVraHBBUUhqZ2JmRzltUCtCRlBheDFMekhrWW1maFRuemRxUHpocy9kMU1m?=
 =?utf-8?B?eVJUWHFnOVB0TmFtMGVHQ29qZjlqTGxoYytlbnRzUTZRUmQ2YjBwNHo0ckUr?=
 =?utf-8?B?YjNnTkNaaFJCek0zeWFWZmt0aEgwQXIwWmtwVTZ0S3BEaDU2RmllZTFiUS9u?=
 =?utf-8?B?UjhoeE5ZTXM4WkQ4R244QUhwNklKY3dsaTMrdlVMeXkxWXpucnh6Q3NLUkht?=
 =?utf-8?B?U1dOb0MveURYb0ZRSmF0SHBCbCs0MXNuM1IreUhSK3dRdU1VMDFBNk12L3RZ?=
 =?utf-8?B?TXNEcDlBVWFJZlBOR0FjMCtKWjZiWDdFWHpmYjlTRDFWdkVPQ1N0Nm4wQjBF?=
 =?utf-8?Q?rrsfctdSTKpCfI7bmGDZPDfXe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb54635-9b5f-44c7-d9b4-08ddea2a0df9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:07:30.3109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COZuOv0+yXRztFsBv1gTsnHeLSPKC2+1k4VotbDO9xHr5Dbkx+5xEN9LrRVEBD7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7445
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



On 02.09.25 06:06, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Later memcg enablement needs the shrinker initialised before the list lru,
> Just move it for now.

Hui? That should just be the other way around.

The shrinker depends on the list lru and so needs to come after ttm_pool_type_init() and not before.

Regards,
Christian.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 9a8b4f824bc1..2c9969de7517 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1381,6 +1381,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  	spin_lock_init(&shrinker_lock);
>  	INIT_LIST_HEAD(&shrinker_list);
>  
> +	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
> +	if (!mm_shrinker)
> +		return -ENOMEM;
> +
> +	mm_shrinker->count_objects = ttm_pool_shrinker_count;
> +	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
> +	mm_shrinker->batch = TTM_SHRINKER_BATCH;
> +	mm_shrinker->seeks = 1;
> +
> +	shrinker_register(mm_shrinker);
> +
>  	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
>  		ttm_pool_type_init(&global_write_combined[i], NULL,
>  				   ttm_write_combined, i);
> @@ -1403,17 +1414,6 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  #endif
>  #endif
>  
> -	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
> -	if (!mm_shrinker)
> -		return -ENOMEM;
> -
> -	mm_shrinker->count_objects = ttm_pool_shrinker_count;
> -	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
> -	mm_shrinker->batch = TTM_SHRINKER_BATCH;
> -	mm_shrinker->seeks = 1;
> -
> -	shrinker_register(mm_shrinker);
> -
>  	return 0;
>  }
>  

