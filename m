Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8412E845
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 16:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618989E4C;
	Thu,  2 Jan 2020 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAF489E4C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 15:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iETTckmBGE6Xp4PZAk+/rJllMM5cPiw7gII/Advx4Z0KdH+OIY3pivQTDWQlm8B7Jy4V2tcmU8v/wp4wpoJyd0TWUcw9477ZcAhoA6ose529KeJgBTKPZErsDrLZfskGwQ6SyykWnUIA1AcXF4pSCxrUIauvatnEWTbpKOmj7+yjE0vLwczUW4pm/b1EPjCjyYSWTJuE/wurCdVrCeypaYYJ/tXOodyq4VHTj3dHgZxT6PCL3LOlt2vTrDQEvE8KyVtRrxIINjEq3W273gay2/T6jmVfDBaw5AnINTKUD2dbs0E3XSnqmv5C/9VET9Ftes4Ha/IxVc08IJUyNJiTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Bvs9dplouocGehPrWdzSLVdhVPlyS6xXnlEj5ZmiR8=;
 b=UOu5vToh+MOzZkMkm7Me2q8rFNKDLh5aINcMT6Ka0ZhyTkh5o2td82O7JBz534KnxhKcADCfgEVU4LMUIT56txJgR6VV2ERXAV6YgqbRkKUxNbdMvblNyHRLLmeyB9MZiem/Uzle60mHM3PuYsn1VEiiFrBgd/JuYEwtfG//XYMY7rZOb4CnY3nxbVKWfXQwlsy/SjyZPVgIanQizPrbTuEAHr7KwKUJDIyuKHZ1GpKdelv5vbhDn6zcolJfLRkggLKhUu3OODH5Yi7sX1JWybj4zN5/Uq8Xq3gsi7lcqhrbVUdbnbmSDYan2YAb0BL5roJ7r1Omt7TU5U5viWizPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Bvs9dplouocGehPrWdzSLVdhVPlyS6xXnlEj5ZmiR8=;
 b=MXpDsSRtCueMNmALF3jCngyB7SJYP/IsrgCOaHYRVkZmiwVP5P+E7KW7zf59bAzlwVF24xPJLiUWp4KA+L/9lPy/rVUFmBOMI89AWSQbGWy6Gzr/gWthYR1X/yFRd/xtIpmeWfLk17CsQhfUzqdCIAKXjD7S9ZSKOCcv8XpnXGo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0070.namprd12.prod.outlook.com (10.172.76.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Thu, 2 Jan 2020 15:47:38 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2581.014; Thu, 2 Jan 2020
 15:47:38 +0000
Subject: Re: [PATCH v3] drm: Set crc->opened to false before setting crc
 source to NULL.
To: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20190726173743.11641-1-dingchen.zhang@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <1559adc4-50d5-ecb2-a05d-44925b998682@amd.com>
Date: Thu, 2 Jan 2020 10:47:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20190726173743.11641-1-dingchen.zhang@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [172.29.18.152] (165.204.55.250) by
 YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Thu, 2 Jan 2020 15:47:37 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2645bbc-78d5-40ef-74b4-08d78f9b1801
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0070:|CY4PR1201MB0070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0070134F9B8440B5DA54D26B8C200@CY4PR1201MB0070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0270ED2845
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(189003)(199004)(31696002)(16576012)(36756003)(316002)(5660300002)(31686004)(4326008)(2906002)(8936002)(81166006)(26005)(8676002)(81156014)(53546011)(16526019)(186003)(478600001)(52116002)(2616005)(54906003)(66946007)(66556008)(956004)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0070;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1W/UP7kLMAh5JKZCXYJ9sd9Qp8/0S05yfzMK4yJRYIlp1w1wgFZvh4mDYWas6zseETqihCMzQkLhFxPjGpp6/4/Wo5Cdxm5dvhJFGJXsaSiBhYZ1DVRwk6kptoYtsp7eNHBEVI6EpyQm/D3xP+/T2WSaPYiKyNnM/UEgn1lVys6uSxuR0+m30Dl2odYGByJO+SfI2D2zmcbbUY3FgxmzRtYCCwjQGzTc+2ljFIN78pA5xUd1hU9R/9/30NFqlSjz77g4A3CeH/NUwZ86zyZ6u/S6IMxMZmx5VQFwPaCTct/0jBn1K6F+IEh90h5G2rgiWRMCnxc1f0pPwWoKrzR63DQG+M2AJQIXGAyPDPy+q3ovqQ3aOFnicxACR8xFjbFt2MT9mOXHOID1QyecgYVK8f0hKI2FfReSOvOL4pSrBCR4Oq+gvzV6U1n0S9hLZzu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2645bbc-78d5-40ef-74b4-08d78f9b1801
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2020 15:47:38.4434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSYU1gWrizZdtjn8D42wUoeJG6YHX9GCrAyjhz6WSSiEtXimNmtQOx7WTm7p0RuaEwhbwwiQRVkEmcRq1BgApg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0070
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
Cc: Nick Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-07-26 1:37 p.m., David (Dingchen) Zhang wrote:
> From: Dingchen Zhang <dingchen.zhang@amd.com>
> 
> to terminate the while-loop in drm_dp_aux_crc_work when
> drm_dp_start/stop_crc are called in the hook to set crc source.
> 
> v3: set crc->opened to false without checking (Nick)
> v2: Move spin_lock around entire crc->opened use (Daniel)
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Nick Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Signed-off-by: Dingchen Zhang <dingchen.zhang@amd.com>

Looks like we dropped the ball on this and the other CRC patch. I'll
merge them now.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_debugfs_crc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> index dac267e840af..d2d2389d8892 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -249,6 +249,11 @@ static int crtc_crc_release(struct inode *inode, struct file *filep)
>  	struct drm_crtc *crtc = filep->f_inode->i_private;
>  	struct drm_crtc_crc *crc = &crtc->crc;
>  
> +	/* terminate the infinite while loop if 'drm_dp_aux_crc_work' running */
> +	spin_lock_irq(&crc->lock);
> +	crc->opened = false;
> +	spin_unlock_irq(&crc->lock);
> +
>  	crtc->funcs->set_crc_source(crtc, NULL);
>  
>  	spin_lock_irq(&crc->lock);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
