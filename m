Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154612D16E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 16:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BECC89B49;
	Mon, 30 Dec 2019 15:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FECD89AB2;
 Mon, 30 Dec 2019 15:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaozLc2DvlKjuZcjv8e5xjNrdEz8uNSqwcW60yMDLvtRECaK4cG9oC+zudctL0tzkfprgxb6l5r/kL5XSXMb6vZ4jyub3n1Cd0pXkKNKpk5YgMLM/y6l2S2NNqiJg4ZZ87Jxo2Srs/8CIM2DgzRwmgRLVOD2nqXPZzz5sZbqdnuLJRcifLve98+HeDfdEgt6WFk4b8vuO6W3hLee0fb7zoBU0R2TKln7tekk12tBLMEDq0h24yL+Kt9l77PJI8X8mknFhGHWgNXy8SCsJkrVCmvcipkk35LcmnrjD6HbWIs+azjsERHFM2chareMquVXNd90bytn3Hv0dTiw4tSeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNKF9m/9ofMbb4nZzqPCNQzyR0yZ7X9BFJ6oeuA3Ulw=;
 b=km7iGg4pyqnlse53/OOnBa/kbTgKSaIMHRyfi85mog501g7o1N3V1kP61NPIFlN0oTnS6QnlMVUtLQ6B0ibU/WG6MkCm6iSI1Joc+wHPn35b8rRPv1ktl711QBIavLIc9SF8KWNTe9hH6nf5tERPrUxYyJYDN6hnCkUT4RuLU9eRl9jDa71C1ZV4zbXwJLaIxh2CV9Rnh9ioFDRSDGvRX/27a2YncK1z91XqM77l77GONQZ6chpx299WiIPH3uxyQOUvwjDxqX9aOlT7KdyXktW+lyjmjlnqin1CB9+MqT4pPXzKACkAFJcWe4ihn+9spAw0fO4MZDGPkXi31OcDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNKF9m/9ofMbb4nZzqPCNQzyR0yZ7X9BFJ6oeuA3Ulw=;
 b=vOGumX4iDJlB5a2j3rE8VWCveXLYuinwrbYJKiwOh7sgGGH/4I6kRbAGcSbusuEXWRAFOFVkmD5VLOq4VhqjelN3DKwtwbSbXV5h9bqO9vH5JSOQb7JzajsbxZvFncanlsWFIi4Z2Sd+ZMRWvgiksfi7Dlk86/Hy6yQcgtDgDT8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0149.namprd12.prod.outlook.com (10.172.78.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Mon, 30 Dec 2019 15:26:27 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2581.007; Mon, 30 Dec 2019
 15:26:27 +0000
Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20191230070516.4760-1-Wayne.Lin@amd.com>
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
Message-ID: <084e73fe-0f8c-a9da-3b20-0dc6804e8602@amd.com>
Date: Mon, 30 Dec 2019 10:26:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20191230070516.4760-1-Wayne.Lin@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [172.29.18.152] (165.204.55.250) by
 YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Mon, 30 Dec 2019 15:26:26 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce496924-d3a3-4581-01d8-08d78d3ca316
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0149:|CY4PR1201MB0149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0149D34F7E65D07E60A52A1A8C270@CY4PR1201MB0149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-Forefront-PRVS: 0267E514F9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(4001150100001)(8676002)(16526019)(186003)(36756003)(4326008)(956004)(2616005)(81166006)(5660300002)(81156014)(478600001)(8936002)(31696002)(26005)(53546011)(31686004)(316002)(16576012)(66946007)(66556008)(66476007)(52116002)(6486002)(6666004)(2906002)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0149;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLeAIObshOiQsUwCk9If5GLd8AAHA7iFAfXeOTaGnSkm8Zh+uqgti/9zVbYZ3UONlKC/6kAvp1Kujg4UsoeZSEvL8wEdO7F8ky5sNsEw2hVjKCebEYWkSsJTwHiKF9SBBQbSPIauKWw7XCujIpwAJsqg+RW5gHOp3h3QECM5LkJeJ3E0nR9F12mgwMkittLskuQTP1zT5IF69JZiTjmmdlOl3S8dECFpSkIGSwTn1W9EX2i1bCFffUYemRBuvJcl8CS826LKXqtUYZkUAtzZQ3Gcn8B6CsulzTAelU7jPtv3lJdR5DN6IITCd1mcx7VOkiaptUJ/AdtVagUs/K6cRO6l8+BZLm2QddrcaSlZxzLlmb4pyHj4Jiq8SNhjBXBXs44B6LXYGRwhsRQyov24ehvLQVqVMKcNSN45on8nIpKY+oWg7Kt5JhwPAEvJTA+t3wlDoYBNJ+UW6nxQBdHyXh5NcTxvd5xHLGmkbvma/7hXvyUi/xyQaZwNU17FJ2S+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce496924-d3a3-4581-01d8-08d78d3ca316
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2019 15:26:27.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CX7mzzxn65f7sKkUt7vGvZAkNZKuG4m5TLTEzciawvMcdCX9gtuBqP0aaHR7u5x6SoObN1wblyR6aenbsnHrfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0149
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-30 2:05 a.m., Wayne Lin wrote:
> [Why]
> According to DP spec, it should shift left 4 digits for NO_STOP_BIT
> in REMOTE_I2C_READ message. Not 5 digits.
> 
> [How]
> Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
> drm_dp_encode_sideband_req().
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>

Good catch. Looks like this has been there since the beginning of MST in
the kernel. How did you find this? Did this cause bad EDID reads or some
other problem? If so the commit message should probably mention it.

Harry

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1d1bfa49ca2b..0557e225ff67 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
>  			memcpy(&buf[idx], req->u.i2c_read.transactions[i].bytes, req->u.i2c_read.transactions[i].num_bytes);
>  			idx += req->u.i2c_read.transactions[i].num_bytes;
>  
> -			buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 5;
> +			buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
>  			buf[idx] |= (req->u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
>  			idx++;
>  		}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
