Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034F39DE71
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04C6E0BF;
	Mon,  7 Jun 2021 14:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5676E0BF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 14:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nle1g8gcWuelYU58H4D3YqQM80DbdjVdfjYCuO0RrBM6/oXSRefbfREyboysIzm8hfI3tCYhT2gbQTSa6mc/1CiUSOjcF61DQL581JDJH83c3wxNkwbDv9hPzWfCfMMpz/HBy5R0qzXyhZDBo46VocRMc+3bywd20ycXDGK57RSnHGM0KPStl9BnMQNcH3ENT5jboNVvJsNDKr5YcH7/Omb4KBiIO11XcZJcfa+Y1dVnw8ZqV92qL47kElSR3NhJQ0gQYVm06q4TsmQaeDPxqnYyPN1bVcl+vOQd4ctWimH+S/BYlOLlr++Kj+QZq+jpXvDaTpKbVnoWqHkh2qGmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nyxQEey+oSL9dhTSFLCNnh7HRmkrf6WQser6I6DCQk=;
 b=Wy2q/JqDMRXUWG84k4F+BrVi2Jre3wr0jPutSfPX+3pCdMdCVLw4NFdZjv8L2ft5rXyai578JFgk0/WJeRRjp5mgxp0UcVyJZiCTjqN0yeGYRhHtxsLRvNwlefVjBFvAahDIOJKGRcHn9vekse5VSEGdhGf8XiM8IK54qjc6KOmeLqXbF+ysWtX8PPGyFmUX84WpWYsssQiW0X1PZaDn34cnIgLZB977oaoSShwkXKHwwSlH5MQ2YWUhOeHI1dHmVf+Vj45UXPkA+DJWdG2KiZ2BhawtGzdk+dRj4sN3JaTAM0y15a9CxxGI3E+R2AJm4P7ytoiat3MCUI1CRa4EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nyxQEey+oSL9dhTSFLCNnh7HRmkrf6WQser6I6DCQk=;
 b=AM1khi9MtcXnNb09tB2Jz+HzZPm6pxDPqsADIi/cBrIt/xnk7al5FuIe/kY04APZbd2BFh/Tw9UQlyJUgh40kvkIfGl2p4Y9dSEAV30IoH4QiYTvkp34jUwTWXwdN9A0JPM/FUntf6NctRRSjv39d087Z8wMvKN7wLRJeKPxl5g=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5389.namprd12.prod.outlook.com (2603:10b6:5:39a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.23; Mon, 7 Jun 2021 14:14:43 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 14:14:43 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Das, 
 Nirmoy" <Nirmoy.Das@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
Thread-Topic: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
Thread-Index: AQHXU8F5JFan/2AF1ECinDA7gAm6D6r43R6AgA+zR4CAABaByQ==
Date: Mon, 7 Jun 2021 14:14:43 +0000
Message-ID: <DM4PR12MB5165EDA10869E4A37D94CED387389@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210528130041.1683-1-christian.koenig@amd.com>
 <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>,
 <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
In-Reply-To: <279b72f6-cf27-c1bb-370e-a04348387105@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-06-07T14:12:53.5300653Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Privileged
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.129.192.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c240edfc-33f9-406e-7388-08d929be9918
x-ms-traffictypediagnostic: DM4PR12MB5389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5389DB0841AD28AE63B9461487389@DM4PR12MB5389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNZAt4VEIueFrsBI0PFKshKNlyTzWkc1D4/Al5+K3hzZhRpCJXI8gJ1fkcY4WzqESq3WjDN5SYO+vc7+KiITpZy5fanh37Mnh6fEepP8hsKnMg4rffhCjMKJtSix7P0+I6WrkdTYhnDCyWbtoCBV4hVTEBO9CtW9JTB8Oh03QUBxVyE/bq3rFP33jHXvxNzy7/qfpt7wM59qYyWUk3KGw8sc41XQnvUqv8vq8GmAfIDLooaIjHvxSb6ZJsbs+TYJspIUm3WVRnq1X7gh6evKdsS8GzdHO7Ohl4Q6SAmWk8CD9PWXFfbZjkuotvbQoKy460Tv19Demma3HRPlevPD+KiR9yq9WVtQSSxJg2J1B2p8HyGwR90bQsbaRGo0in1LKiU3g7xleQWxm9+sev7MbJLJAxr/g3WalpGyWVInMjBN7TPMEVQYLUrB8L6bRVnD2NaApfGjTHJIb29w3qT1kIje7L2+tsEdgdooOItBf5fcz57SLcU+zKLrrIABD2SXKQtqY3BteHm9i0jVHR11x7MxBv/AgtQZLh+4Rsj4WQ7gT9ewNh9Zlb9Dh17gMG1XiXm2bdSNnasMi+selHVE/fLCl61vm4/+OS9CKOJCxs0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(316002)(186003)(110136005)(4326008)(7696005)(2906002)(8676002)(122000001)(5660300002)(33656002)(26005)(86362001)(6506007)(53546011)(52536014)(478600001)(66574015)(9686003)(55016002)(71200400001)(83380400001)(64756008)(66556008)(66476007)(66946007)(66446008)(8936002)(76116006)(91956017)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+GRQSl+0SKhP7WPBVCiTcsdusTyDappiMoRWXfUsIrN2jJA7ZH9dkaaAUg?=
 =?iso-8859-1?Q?O8/ucy1mTmvfqJvqIM3DjC4PEt5tXzFneox3McRmTrWaeeudEqyMbpbwmo?=
 =?iso-8859-1?Q?N4u2pxqjv2IzJMwtDQUsOwF4gbuGptqlYoPZKHrTWVYPWaPt25Jmkj+6JK?=
 =?iso-8859-1?Q?DF2UrMHC/wlkdk4yAj10oGsb2/0EqsuF0LFElfOO11uIhrz/9gIK/J+N0T?=
 =?iso-8859-1?Q?DTMMnx3h9Mq6GPuIj+XbS2ZaB0juJfzEKgjzGceK4tWqeI1JZQ7KIX9GDE?=
 =?iso-8859-1?Q?1gYMbk5ToVYj62zuboYAov3TscyDlzqW9QMQjMFz2Y0oFT0ODdswcDaW8k?=
 =?iso-8859-1?Q?KoS2z7NYjoYVApRDCSzUn4WCtNYaIKgRPNN/a91lGe7FBZJb///j1ufnB0?=
 =?iso-8859-1?Q?vShBfebfoagaWahndnwtR18MAbAFGNGcLX26+W7St0AUUTy1i0wlHtGFIk?=
 =?iso-8859-1?Q?Ti1KSEDt+StxBzIDwM6zqLMSJrLHINGuBecTpbLLC1N/kmGY4jN5vbHs9U?=
 =?iso-8859-1?Q?RT9ISk9GUxPZoYEu37JiSNpaVxaVotZQmY+W5reoECNc6MwqeU+m+FfM8W?=
 =?iso-8859-1?Q?glQ84WmYMkMlgr6rdmPmAGwT1dTV2sPkhGBDFqoUmOyP5Tl8pqOXWeztsn?=
 =?iso-8859-1?Q?gLKlN6I9NcleTFVLyt/cAoM3hwql4xxelJfrZzgp1dNjlinu3G+6JJa+PA?=
 =?iso-8859-1?Q?nEup43XoC7CgWTAEd6JclKykkPWKN9HcnuE7ELC1NmJrawYp8a3Zrq4Trv?=
 =?iso-8859-1?Q?L9Pm3ftj1hiTmxJuaW5+W1+zyxPE6TdWag0YoL7LfdiOIsr+V/olpKPsA7?=
 =?iso-8859-1?Q?XW3AnHQP5YKmLzNVcN8PqrZ9J14FWl5HOvgomGdVyEwM1J/00J6we5hIV4?=
 =?iso-8859-1?Q?9+KPTsPCh8gNBkEoFoWD0yr1KYElzNJnf8F7RklBWA12xQwZhV1OtqdybS?=
 =?iso-8859-1?Q?SOleWo+hZUrJC//JJveZO8NlzJf64bBL0zM/34K4FFO2TFk5cr6Rb1RxoK?=
 =?iso-8859-1?Q?k49obQELakvwVXU+LL9alYTADugfUPqOuaeXTzvRcXoF9wi8HeRnPPqCUu?=
 =?iso-8859-1?Q?RXzCH0mzH0veMzpiKFKQ4aqJiZvggiX0QLqv8196000jjN8wyD2D3FL1sw?=
 =?iso-8859-1?Q?XW2nmfjotfrekYL+YYMXHF/TfIoa0E7bw1o9LitnEy0ZuFvkHOan0k+Nb0?=
 =?iso-8859-1?Q?SkAo5/tvrAySYBCnyYmgty6XV2M6aSnhBajFMSCWIVpceEsQduD+09+9d4?=
 =?iso-8859-1?Q?I0h3qAtGrVoF408FClxlbBNHpcj7HqT3crRjdRwyfkhJIP48gjjzbPQI+m?=
 =?iso-8859-1?Q?CffvjTE2FpT1gMctrg1LRHOXY1xEKtskAJd1FXt5G/5nUbFZxHXGOcKjr3?=
 =?iso-8859-1?Q?Hlygyd86gY9O4rFFAK52dqW2xQNHSEoQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5165EDA10869E4A37D94CED387389DM4PR12MB5165namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c240edfc-33f9-406e-7388-08d929be9918
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 14:14:43.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iFaKpMS96nrUfYLicnypgC+yn9WDXhphTgy8U5vEzCRLa5a80kDXmPVX+og3x3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5389
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
Cc: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM4PR12MB5165EDA10869E4A37D94CED387389DM4PR12MB5165namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Looks good to me.
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, June 7, 2021 8:52:21 PM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Pan,=
 Xinhui <Xinhui.Pan@amd.com>; Das, Nirmoy <Nirmoy.Das@amd.com>; Huang, Ray =
<Ray.Huang@amd.com>
Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock=
 v2



Am 28.05.21 um 15:06 schrieb Thomas Hellstr=F6m:
>
> On 5/28/21 3:00 PM, Christian K=F6nig wrote:
>> We need to grab the resv lock first before doing that check.
>>
>> v2 (chk): simplify the change for -fixes
>>
>> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
>
> Hmm, OK, but this doesn't fix the swapped-bo-not-on-lru and
> unpopulating from swap_notify issues. Are you planning a follow up
> patch for those?

As discussed in a separate thread this needs to be applied as needed
when the DG1 branch is merged.

Xinhui, Nirmoy, Rui can anybody give be an rb/ab so that I can push this?

Thanks,
Christian.

>
> Thanks,
>
> Thomas
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-
>>   drivers/gpu/drm/ttm/ttm_device.c | 8 +-------
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index cfd0b9292397..ebcffe794adb 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object
>> *bo, struct ttm_operation_ctx *ctx,
>>       if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
>>           return -EBUSY;
>>   -    if (!ttm_bo_get_unless_zero(bo)) {
>> +    if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>> +        bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
>> +        !ttm_bo_get_unless_zero(bo)) {
>>           if (locked)
>>               dma_resv_unlock(bo->base.resv);
>>           return -EBUSY;
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index a1dcf7d55c90..3d9c62b93e29 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bdev,
>> struct ttm_operation_ctx *ctx,
>>             for (j =3D 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>               list_for_each_entry(bo, &man->lru[j], lru) {
>> -                uint32_t num_pages;
>> +                uint32_t num_pages =3D PFN_UP(bo->base.size);
>>   -                if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
>> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>> -                    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
>> -                    continue;
>> -
>> -                num_pages =3D bo->ttm->num_pages;
>>                   ret =3D ttm_bo_swapout(bo, ctx, gfp_flags);
>>                   /* ttm_bo_swapout has dropped the lru_lock */
>>                   if (!ret)


--_000_DM4PR12MB5165EDA10869E4A37D94CED387389DM4PR12MB5165namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black; text-align: left;">
Looks good to me.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, June 7, 2021 8:52:21 PM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; Das, Nirmoy &lt;Nirmoy.Das=
@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;<br>
<b>Cc:</b> Thomas Hellstr=F6m &lt;thomas.hellstrom@linux.intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix deref of bo-&gt;ttm without holdin=
g the lock v2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
Am 28.05.21 um 15:06 schrieb Thomas Hellstr=F6m:<br>
&gt;<br>
&gt; On 5/28/21 3:00 PM, Christian K=F6nig wrote:<br>
&gt;&gt; We need to grab the resv lock first before doing that check.<br>
&gt;&gt;<br>
&gt;&gt; v2 (chk): simplify the change for -fixes<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<=
br>
&gt;&gt; Signed-off-by: Thomas Hellstr=F6m &lt;thomas.hellstrom@linux.intel=
.com&gt;<br>
&gt;<br>
&gt; Hmm, OK, but this doesn't fix the swapped-bo-not-on-lru and <br>
&gt; unpopulating from swap_notify issues. Are you planning a follow up <br=
>
&gt; patch for those?<br>
<br>
As discussed in a separate thread this needs to be applied as needed <br>
when the DG1 branch is merged.<br>
<br>
Xinhui, Nirmoy, Rui can anybody give be an rb/ab so that I can push this?<b=
r>
<br>
Thanks,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Thomas<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp;&nbsp; | 5 ++=
++-<br>
&gt;&gt; &nbsp; drivers/gpu/drm/ttm/ttm_device.c | 8 +-------<br>
&gt;&gt; &nbsp; 2 files changed, 5 insertions(+), 8 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/tt=
m_bo.c<br>
&gt;&gt; index cfd0b9292397..ebcffe794adb 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt; @@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object=
 <br>
&gt;&gt; *bo, struct ttm_operation_ctx *ctx,<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm_bo_evict_swapout_allowable=
(bo, ctx, &amp;locked, NULL))<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EBU=
SY;<br>
&gt;&gt; &nbsp; -&nbsp;&nbsp;&nbsp; if (!ttm_bo_get_unless_zero(bo)) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; if (!bo-&gt;ttm || !ttm_tt_is_populated(bo-&gt=
;ttm) ||<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ttm-&gt;page_fl=
ags &amp; TTM_PAGE_FLAG_SG ||<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ttm-&gt;page_fl=
ags &amp; TTM_PAGE_FLAG_SWAPPED ||<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !ttm_bo_get_unless_zer=
o(bo)) {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (locked)=
<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dma_resv_unlock(bo-&gt;base.resv);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EBU=
SY;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_device.c <br>
&gt;&gt; b/drivers/gpu/drm/ttm/ttm_device.c<br>
&gt;&gt; index a1dcf7d55c90..3d9c62b93e29 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_device.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_device.c<br>
&gt;&gt; @@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bde=
v, <br>
&gt;&gt; struct ttm_operation_ctx *ctx,<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for =
(j =3D 0; j &lt; TTM_MAX_BO_PRIORITY; ++j) {<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; list_for_each_entry(bo, &amp;man-&gt;lru[j], lru) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_pages;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_pages =3D PFN_UP(bo-&gt;base.size);<=
br>
&gt;&gt; &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!bo-&gt;ttm || !ttm_tt_is_populated(bo=
-&gt;ttm) ||<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ttm-&gt;page_flags=
 &amp; TTM_PAGE_FLAG_SG ||<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ttm-&gt;page_flags=
 &amp; TTM_PAGE_FLAG_SWAPPED)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; num_pages =3D bo-&gt;ttm-&gt;num_pages;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_bo_swapout(bo, ctx, gfp_fl=
ags);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ttm_bo_swapout has dropped the lru_=
lock */<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret)<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5165EDA10869E4A37D94CED387389DM4PR12MB5165namp_--
