Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C584DA70
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 07:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BE210E1CE;
	Thu,  8 Feb 2024 06:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JiS9/G0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF8510E17D;
 Thu,  8 Feb 2024 06:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWf65VX/z520r+iBztHhqvJaTzi0Anze2gpb/VpmftoryAZjxc1GOWYLO19BcGSQK4P7rjhaKp19/mNsSvaIa/s7bRm6UwfpmBoSoWqFoHJ4+PSQMPb5/QwKBxCrOwWKXjs7a7BD9xesWKntVU1YjHbj7N10zIbhYerd8O7TvHVY4ZFD+I7mHhqbc9elhHSYmb0WFZSjBM/ekeITO7CBAvVZB8DTsPEEVZxa6MeJq8v8OJ2maaj1ajj+q9l2LUGCGtcTuClwcrskPWZCpRm6S9UzDMJTdsQNAqz73F9gx88nwngtaSqVHWFZJEobN6mxq5UJ8X/ljh6oayd7k5SHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKch8FCC8ZHqVqJwfO+j8DrW2teSSf5g17jZgokfox4=;
 b=ETAuCJamM+h2oSNKAXLDvVgiI3EL37xkROG7y7PUTZT9kWBO0WTsQuPdSFXIjP4qy+BzGSHDYwA2kNoM2JDNYwql3t76AE37djvbp6/+IbDtCLP9PnRJ0CzaAAYiegcIlbf3LWQJ4BEyMqTKYOqCR4sjettqFK1fLuNtv0O886oA2M/L5+JB0WGgBwQ4h4wlYXdXpi4UeTfusAh/1/u8Y1OtwVfHEbgfT05MnQDlM3mB62tDkC6fJQj9CeKFRneQNLfkNnTj+LmurI29yNIWjurAv+8NuTC8diAGiSLOYoNrcbhs3bsTmkdgAtpEORJ8MT4yIRsDZjhapE1LwfgRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKch8FCC8ZHqVqJwfO+j8DrW2teSSf5g17jZgokfox4=;
 b=JiS9/G0Hwt3z0pksDKTCrOyUU8rbFw+0dDkE5kr6DXnc7VK35O/n5o1selhNHMzNhnrWtSqbk0SBnlZdwGWQgpth6RLbs9o9ABebR5tjTSeNJA8gZbsjrOBV7z9d/6OdEfk7r7lQxAZi2DAJwqI8jw/mSxfItDKNWM8iLSzqt40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Thu, 8 Feb
 2024 06:57:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 06:57:09 +0000
Message-ID: <07ed1fee-cb73-49ba-bef6-ca16b4c808e4@amd.com>
Date: Thu, 8 Feb 2024 07:57:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN9PR12MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae49fc6-5ae0-4cda-8c7f-08dc28732b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8I+Mbu0fA4FLuJ6IIN9iah2LcJTY5tQNr+GzHVUZMvVh981g5R1bNuZWda6YaltFgnrMtDAA0I6m1QeIMRxYcpV1C4XqxW7hQxgwGaK9f+j0eRV9tjNJtcJAZclFA1wBBDJlc0v4eJo1exUDKjKI8TAUC8eEgRaWjP2JXdCSg7UHnt/StF7CZIKr98So+V6gXfc2Au53otBZMDaoKaGKaYanb+1BY2THBNaF6FWDccE303THQaziwJwO6Bn6VF/WOlwL867j+CxniuVuX7pdscdA2J/Zgi4PX4DIt1fEVwADo2Xo6sPvfU/Mm5Rw5SyuppYpu4rkveq5NsglRWjL8Z5cm38pd6CWuG/dnAoYLOG/JBkcWPwVsP2MILzHJQup+rOK7JnM7z2Wz7iMoyreUsZXB0Z/v93+Hi9XQOuy0qnq5KlkdnNKQ5x5MDs/6WAu60R8mVlqcxK+nJG1tjHTjoKQywDX4JL4xZYepeMNeAs/Wm4pd5dHJByKUGiEd1TxU6jfd+mqCkNS3kX/ex90qTeBo9Q3z5/TRkPt8bhrzmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(396003)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66946007)(66556008)(66476007)(83380400001)(36756003)(316002)(31696002)(38100700002)(66574015)(26005)(31686004)(86362001)(6512007)(41300700001)(6486002)(966005)(478600001)(5660300002)(2906002)(4326008)(2616005)(8936002)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjNGUnk4aWxDeEszL1kyd1UrTWNlbjNqNFpOS1hOTzlwRGp6SWlCbnNHWmg3?=
 =?utf-8?B?YVlJYTVXS1p0SjZmajRPN3FvWSt3NWtFTjlpbWFnemVkZVFhUk9sM05zNjd4?=
 =?utf-8?B?dE5CaTBtcXNtb25GME9qbWQrcm1qRklvWHlqN28vbzlHVFQzM2ErcVhTQW9h?=
 =?utf-8?B?MHJTVjZsREJjRTlLWktyaHc2Qm96eE5HcEhWYjRPV3lDNkFFSHRLbHJMbjly?=
 =?utf-8?B?RnJmSEc2Q3BrMHZLSUxES2VVOUhGaXlRdDJrTE9uTzYySHBJZTVtY1JHUld3?=
 =?utf-8?B?N0wvc1hqSXE1UXB5bGVLc3RKS1A0emJUSWM3OTRmckd2TVYvN3NpNS9uUjc5?=
 =?utf-8?B?WEh4dE5KRjNINHVPRlBQSkoxcU41clVBblQrWDB2eDkvNXlsUDZrckpvekEv?=
 =?utf-8?B?bndUSFE0Y3dUVXBpckFNTDgrQmNmSE9Va1FRZnRrRzlkQmtnSGlXbDBQRDRQ?=
 =?utf-8?B?N1d4bEgzRXliNlZqVXRXRFJkcjdFQzRuMTRUK241YnJlMTRwOXpsV2gyeGxX?=
 =?utf-8?B?QjllTGpJbzNyNGxLc1hZRldweHhEcG4wNVZwZ1ZuWUZYRGdrQmcrV3QvcklO?=
 =?utf-8?B?eUJHWXZvOSs4NjBUQmpmYlo2SjVkRjg0dlJCbnBKMDZQdlJEVjd5dWZ5OW1R?=
 =?utf-8?B?VncreU1JdFFxTmFITDlHd1FFWG44RkxHbGhrM2I0QTJhTmlxcDdQaVdjOU9N?=
 =?utf-8?B?U24xbVhQQmtpclF1c284NjBaYllnaWl4UXdUV0QzT09WTXR5MTI0QUFXNUlW?=
 =?utf-8?B?aW5BSC8zSmNUT1d5d1NmcDJiTUxLeld6em1XTGpqaGRHZWhCWVlNRWxaQjZo?=
 =?utf-8?B?QklPY2ZiSmhaaHN1RTI0aWNXOXNKODBZQ3FYVURITnozTkRhVHprKzNRL2M2?=
 =?utf-8?B?OTJMMGRSMjBxMGJIVjlFLzl3STNMeVpMREYwRHRSN21FOWtWaWpZbkpDTmlS?=
 =?utf-8?B?Qjg5d1BOWlZwV0lGQkpyUUZnTElpKzFpVU5SbnJDQU1aQ0l1MkRZS1BuL3Vs?=
 =?utf-8?B?MDBoNW1VRklqbHUzRUdkdlNiVERDV3RKT2FqSjh0Y041UU44K2JyTVZWOFRs?=
 =?utf-8?B?WDdHK0NjSXVaZFNUWGZ4ZU5lUW14WWhRaUQvRFhxU3BvZGUrYlVHeElXTHRC?=
 =?utf-8?B?eDc5TTB4U0FObEhFN0ZKKzdObUxIZWt2V2xVZDFCRWFvZHFZNW1tT3B3Nkp2?=
 =?utf-8?B?ZUE5ZFJGbFBsS09nNWNYc3Z3azdOakozSHJ5Q0JvSkxIQ3FCY1d6T2hoMVE1?=
 =?utf-8?B?MGhVbE0wbW44Y0Rab3kreGpFbHpvNWxGN001OTgzT1VqSGVDcHovQVE0WGRk?=
 =?utf-8?B?RlF2YUd4czQ1ZG9xMEdDNkI5Q090VDFkbkFIQmJWZkMyUE1rbTEzK1ZWM21H?=
 =?utf-8?B?Kzl5YTcvRVNRVFl5SDdiSCswY28vQ3ZTZ0J5cm4vWVhabUYrL1dBamR5a2JJ?=
 =?utf-8?B?WFBpejIwVEN2a09BZE16U2xFVjVaeDF5VmREaFVoWE9BdXBNcmpIZi9XQml3?=
 =?utf-8?B?dWdtallBdTZoMC9MMTBjNHVJWGhYUCt4amYvNTcyeE4zRVc4YTdxYVB3MTdn?=
 =?utf-8?B?dlBxcE5DeTJoNjRFa1R4dkZBbXlORmNFaUhweHVvTUJJVmtnTllHK2lJVUhu?=
 =?utf-8?B?emNPb3daQi9QbGRyd3ZMTmhsY3Fwck0wTTExVWxnbFZHN3N0Z2R2L3NIMi9X?=
 =?utf-8?B?TWVXNVBiQ1Bvb3dYamRUdXp2MkNYTW9Rak5yOVpaakNSblNmY0REYmw5cUYz?=
 =?utf-8?B?MHpHQW9IL1VGcHlLVDFVcnk5UitscFd4Q1M1SnlkRy9wb1JFSXFING5nMVN0?=
 =?utf-8?B?aEtFdjM2dEIxZlN3N3YybG9mc25DWmEreDBiUnlMeTA2SGpPWlNiWEpMTE93?=
 =?utf-8?B?blhkVEoyaTNoVFdqQ0N2TG5XNG54K2pCUk5EVitmMkVGNUtvWHhFbVpmNDUz?=
 =?utf-8?B?UU5wck0yaGZmU3Flbzh1clg0YkZUMlZ4d01uNkk2SndaOThKK0xHYnJRSFIw?=
 =?utf-8?B?MXV6ZDNNenFKdHNnSGU0bktsMnd2LzZXdUR1NXh0a1IwZCtiNEwzLzhoNHQr?=
 =?utf-8?B?Z2pwZDZzTERyTGk2dHREc3BOQmhlcFFQYlBRZ0lpb01ZS3dZN3FqVE4ySURN?=
 =?utf-8?Q?jpy7f9Y7GAa4WbVOsmvfF7N7x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae49fc6-5ae0-4cda-8c7f-08dc28732b06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 06:57:09.0719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgKtWS2YDogIgbG3tJNMwbnDmquiOTOC0INohMDABzcMCDvZSLnCZK42Vvo+0mzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
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

Am 07.02.24 um 18:44 schrieb Arunpravin Paneer Selvam:
> Few users have observed display corruption when they boot
> the machine to KDE Plasma or playing games. We have root
> caused the problem that whenever alloc_range() couldn't
> find the required memory blocks the function was returning
> SUCCESS in some of the corner cases.
>
> The right approach would be if the total allocated size
> is less than the required size, the function should
> return -ENOSPC.
>
> Gitlab ticket link - https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

CC: stable.. ?

> ---
>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index f57e6d74fb0e..c1a99bf4dffd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>   	} while (1);
>   
>   	list_splice_tail(&allocated, blocks);
> +
> +	if (total_allocated < size) {
> +		err = -ENOSPC;
> +		goto err_free;
> +	}
> +
>   	return 0;
>   
>   err_undo:

