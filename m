Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189DB118C48
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 16:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DEF6E104;
	Tue, 10 Dec 2019 15:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F636E104
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 15:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OytAIw7ydSM3mGdbTY53mDW2aizo4WJcs85N8awROtOAHgESebeRp/mqehmQNzL2Oe2yKwg2NbgaQArSc1ovz0cXPg8DefEj2WNkz86eanf+4lJZ6R86Cx09xiKtznXsVeQvWOgCD/SqTBMGsAmDrowk0kAZmWl7b6lhxrnR5nkObAuEnPTaZ5ISKuv/K16a2YmOtq1+ycVpEX07pgUnCx5tewHmEri+1RjsbuyekZlvKR7uQeViLZIudixSLSrlrqy0r6KC61Lf9p1OdW6Ieguc4FVXcwsuMl+3I5uiTMg6Uv1CkwU7PzrmA0/QtdHRILu/NwIKJ7ih1ONZzNvAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93wrPJMW31VpPd8EsKoAg9Ya+0bYilQVw3j3du6FlMQ=;
 b=V0sp8E9wcK/1luKmKB4tYg+yViawwOS/WF37Et/P2vmyS6OyKnoaX9JJs8m3MniEmBBfIz4uBIGE/xxogdbONO45dNt0G0T4STr6NjSffyb0S7NCaRrk1Beluv0WW/gtObNUD62eIQAhxWFCEawCZxpBalr1/KGPHtpnkg272CV1eJk2zi20gGiiWJD4VgK+0JzvVN9WHKfWXHAIDyPy5x8QhruDt7Us0YTGwRfzCZg0fwd31HQU92XOs/hydvWCvGbBJrZIzyifGNe0bkENTJZTmEnZ2UkCkL3i55OlZH7LUys1qnA7O0jB+aiICVsAzyGbQiabn3gYvInQidghKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93wrPJMW31VpPd8EsKoAg9Ya+0bYilQVw3j3du6FlMQ=;
 b=1uM9BvvNJzbtlk8XU60ffkf0CIggWlOEyzZSzpSJE5ZmmvO4Mm5rFE5o+ROkTTdRM9/wzXvYQcBeypDinnftCHK0jJTNPl9+beI03GA9aCxQT+0fCRQUahCjERPUdedGKw3YbjeAarRHy972yFla/s+0Sb3LV4/6W2Bdh3pZefI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0056.namprd12.prod.outlook.com (10.172.78.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Tue, 10 Dec 2019 15:16:30 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 15:16:30 +0000
Subject: Re: [PATCH v2] drm: add dp helper to initialize remote aux channel.
To: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20191206225638.609-1-dingchen.zhang@amd.com>
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
Message-ID: <bbae88cf-61f0-f74e-8bd3-a5c9604f296d@amd.com>
Date: Tue, 10 Dec 2019 10:16:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191206225638.609-1-dingchen.zhang@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::45) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62576c2d-60c1-4143-d863-08d77d83eec7
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:|CY4PR1201MB0056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0056B2BCE890EBA1ECAFAE0E8C5B0@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(199004)(189003)(2906002)(6486002)(478600001)(6512007)(54906003)(966005)(66556008)(8936002)(81166006)(8676002)(4326008)(6506007)(66476007)(53546011)(186003)(81156014)(26005)(36756003)(66946007)(52116002)(31696002)(31686004)(5660300002)(316002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GmarlPl5j37myL4hxothpzuiW32BJjmDcR80SH5wnHdsI0/kwhK97O2VpFxMKgI/UkBRu6OjtQIw+jfTXDphcUzH+Jsh0eL3BOt03zJn9V1AtiOjjAEiR1g9jrXPYdsuf8wC31xEO2Myr72v9snSC1cRRPIa6xMbyLaTMR62pfnMe0ICBANUOw2n+auJBKtvk3zue5cvvanAJo7rG0HPRVmvsci9bi7LKtWqM7atS5/zlpEMn13K1HwOcW2zn0aic6mNkQAqQrks0NfHjbW104NvPv33ubOk16nmAT26FlTuVUxhcUZocYjpqNgdpgbqPVTV3wxJsKQCK1Agz88GwYMf+uE7plLXtIr1Ge9K6FLqTiZHvA/iDk+CU77RhE1W13//0xfBEoq6W0m+strT5HWffhgo7siWOLfxMo2o+UuMvsxuKBFMsHIKF5fZKFIHwq0i2Pmq5cNbdz5qZGi+MXdVzFv8MCJeJJ3IAPJhqI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62576c2d-60c1-4143-d863-08d77d83eec7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 15:16:30.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bG8dnnlGR0fCmLnc0aKR0DSTj7gIc1ey89X7GwuP1EZpO/uyBz1FbRzhyUxpKHDpIpCG5hu9MZj1r7SD/w77YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-06 5:56 p.m., David (Dingchen) Zhang wrote:
> [why]
> We need to minimally initialize the remote aux channel, e.g. the
> crc work struct of remote aux to dump the sink's DPRX CRCs in MST
> setup.
> 
> [how]
> Add helper that only initializes the crc work struct of the remote
> aux, hooke crc work queue to 'drm_dp_aux_crc_work'. Then call this
> helper in DP MST port initialization.
> This, plus David Francis' patch [1], fix the issue of MST remote
> aux DPCD CRCs read.
> 
> [1] https://patchwork.kernel.org/patch/11217941/
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: David (Dingchen) Zhang <dingchen.zhang@amd.com>

Patch is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_dp_helper.c       | 13 +++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c |  3 +++
>  include/drm/drm_dp_helper.h           |  1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 2c7870aef469..cc4845d0fcb8 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -968,6 +968,19 @@ static void drm_dp_aux_crc_work(struct work_struct *work)
>  	}
>  }
>  
> +/**
> + * drm_dp_remote_aux_init() - minimally initialise a remote aux channel
> + * @aux: DisplayPort AUX channel
> + *
> + * Used for remote aux channel in general. Merely initialize the crc work
> + * struct.
> + */
> +void drm_dp_remote_aux_init(struct drm_dp_aux *aux)
> +{
> +	INIT_WORK(&aux->crc_work, drm_dp_aux_crc_work);
> +}
> +EXPORT_SYMBOL(drm_dp_remote_aux_init);
> +
>  /**
>   * drm_dp_aux_init() - minimally initialise an aux channel
>   * @aux: DisplayPort AUX channel
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 87fc44895d83..edafa182264a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1945,6 +1945,9 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
>  		port->aux.dev = dev->dev;
>  		port->aux.is_remote = true;
>  
> +		/* initialize the MST downstream port's AUX crc work queue */
> +		drm_dp_remote_aux_init(&port->aux);
> +
>  		/*
>  		 * Make sure the memory allocation for our parent branch stays
>  		 * around until our own memory allocation is released
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8f8f3632e697..b2e6923d5929 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1465,6 +1465,7 @@ int drm_dp_downstream_id(struct drm_dp_aux *aux, char id[6]);
>  void drm_dp_downstream_debug(struct seq_file *m, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			     const u8 port_cap[4], struct drm_dp_aux *aux);
>  
> +void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>  void drm_dp_aux_init(struct drm_dp_aux *aux);
>  int drm_dp_aux_register(struct drm_dp_aux *aux);
>  void drm_dp_aux_unregister(struct drm_dp_aux *aux);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
