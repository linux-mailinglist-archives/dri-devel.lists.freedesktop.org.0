Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6112D99F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 16:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603716E23B;
	Tue, 31 Dec 2019 15:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77C06E23B;
 Tue, 31 Dec 2019 15:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRDasIVL9kJqpX02VuGIhVL7nQVq0ub8TFNV4UJJmdzbgHIIy6uU5cy6W+ErnkuP2vLbfEPoxIDHEfOO3vXHMmAGn1fRvE1kXGLEHzkpp0bfQRqO1FZzXZ8qN/sHdk7HI/Qe6x7xVLq/DgMOfhtmSJsdL3hHmh8b4eXhIm3bikEqdqflrtYYOBygqCjmnWRAEgObPKuqSywu9o5nh/HW3NTL1gPJyq44sHwakAhuKhR27HkAweYROOGIlkoHF8jXEPyTcXtRcbb1NUaHLLU09oIdoKRVB9YnowtWnaYCq+a/vDJ4uZwe1iQpdO4vZ8bHYGLF1sSSykd1fluNf2M3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stFZ7TTRIfJyv/F/VluoANj0c0uwwHDYsze+jmagvmA=;
 b=devFBFCoZNQkOXVKzyBfBLTQSSmIIVKjC3ylNqBvJtff5GtUiUUOiP5r5mbdEavHVdFcq9DmpJtsEbP9hLbObIDvfa0erEnn5b4GkYrypS/7jZAUkDTQFgbKwoZS/M01WNAv6XRtd5+hoYVphwIvgnmoB58zAohCOT9As+7c/x90+GDYJzXkq0OzVRMPPMkYGOh1NepliPkTadGQ5Nf9kQ/dIb645blW82hRwccHnrffl7rf5MUueqIjBG3x4P3pfJUwfnL8Uuixx+UgCN/vRk4656sO7frP2wcX9qexdLMmZwSYMVNeMe/cVaFQNjUqV7s4y5dMB4oq+Hq3GZb7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stFZ7TTRIfJyv/F/VluoANj0c0uwwHDYsze+jmagvmA=;
 b=IPzWIBrF9RsGMwKt7cBw+M3kI+KsTOcn0GEbX3iFvU59B/pSZVP5HiQSEkId+Iv12FJXWZET3Z23geqS54GwvROQTGbcpIEG3MI0PkaYRnqxEltGD4ivL7uvVmIIid1HHOJrFb5iQsfw+P/pC26lo4K4yiHPa9pAgevToTBlSG0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0071.namprd12.prod.outlook.com (10.172.79.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Tue, 31 Dec 2019 15:08:34 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2581.007; Tue, 31 Dec 2019
 15:08:34 +0000
Subject: Re: [PATCH] drm/amd/display: Fix error returned by program_hpd_filter
To: Aditya Pakki <pakki001@umn.edu>
References: <20191117172236.2140-1-pakki001@umn.edu>
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
Message-ID: <b176fd4b-b2d3-8741-e1d7-f9b0899bc24e@amd.com>
Date: Tue, 31 Dec 2019 10:08:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20191117172236.2140-1-pakki001@umn.edu>
Content-Language: en-US
X-ClientProxiedBy: BN6PR14CA0038.namprd14.prod.outlook.com
 (2603:10b6:404:13f::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9240:e3a::6] (2607:fea8:9240:e3a::6) by
 BN6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:404:13f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Tue, 31 Dec 2019 15:08:31 +0000
X-Originating-IP: [2607:fea8:9240:e3a::6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 589b6283-b187-4238-1452-08d78e034dbb
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0071:|CY4PR1201MB0071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0071A9A43FAF95320AD228C88C260@CY4PR1201MB0071.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0268246AE7
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(189003)(199004)(53546011)(31696002)(52116002)(6916009)(8936002)(16526019)(186003)(2906002)(4001150100001)(2616005)(31686004)(5660300002)(36756003)(8676002)(81166006)(81156014)(66556008)(66476007)(6486002)(478600001)(66946007)(54906003)(316002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0071;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lFVg82GOhpQLcFxVhZeJo4q0//XbzZ8CYk42ApY6RsmPmgHdG+Qo5qySvjmK0dnEAwM3/lbigJiDLgsMXt/awi4CdVIGtjCngqJ/Qxzuttm/SWUQAQCKT3cXhlUAWFCThLnK14MXPgHttRIT/XW8kwcMotLVjs7TpNgiJFv2c5GhsY3ElAaRgWu4tJGjYsMS0gapH11Ko7iWZlyZ8fSTliP1e0U/0sT8H+wKqTKOlb6S34gluIVy2OhJxKdcDIenBGymDcUpKdNQbdjsRlKeG/vBsFsXseezkwB4qIhbqjyL6QUSsyWtVmF7IfKJWxe9lqCd8as8vUmxI4zfWpfABaEJB4WBEvSvJPcYpF+KfvnVCvr/Pc2Q//t6OxiwKHaQhIcJY48Y/Gpd1Tl6+DbXDqLSHQtfcfYFhIEZRUhft5+bdpx+8csoBPumsGXhfok
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589b6283-b187-4238-1452-08d78e034dbb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2019 15:08:34.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAfImcobQzOIEg2SO4wHlFRaJfSGMwsrxdwTNMYBlfAOF9fcOFZ4srZ8LtAj9Y78YurQQYwFmGv/BvU1kXMJyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0071
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
Cc: dri-devel@lists.freedesktop.org, Chris Park <Chris.Park@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Eric Bernstein <eric.bernstein@amd.com>, David Galiffi <david.galiffi@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-11-17 12:22 p.m., Aditya Pakki wrote:
> program_hpd_filter() currently fails to check for the errors
> returned in construct(). This patch returns error in
> case of failure.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index ca20b150afcc..bbb648a50c41 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1379,9 +1379,8 @@ static bool construct(
>  	 * If GPIO isn't programmed correctly HPD might not rise or drain
>  	 * fast enough, leading to bounces.
>  	 */
> -	program_hpd_filter(link);
> +	return program_hpd_filter(link);

We don't want program_hpd_filter to become a fatal error, which this
would do.

Though it would be good to print a warning if program_hpd_filter fails
as it's unexpected and might lead to bugs with some displays. In many
cases failing to program the HPD filter won't lead to adverse behavior.

Harry

>  
> -	return true;
>  device_tag_fail:
>  	link->link_enc->funcs->destroy(&link->link_enc);
>  link_enc_create_fail:
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
