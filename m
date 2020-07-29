Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDA2321AE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B27B6E544;
	Wed, 29 Jul 2020 15:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811526E532;
 Wed, 29 Jul 2020 15:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwDsu/TWfZt/Nda68YjEHsCmtCMOR96+My2qAT5fDD6xn11+ybtOsQ2eKcXQFhVq/ztxDPLen8CZi6TTan/MXMNZYz0c8dgNV0JZsf/KJE0wimx3Q+T0whdPpUewNAOS9jgbDXzQSl9SjTbKUJexOrdWHTwkPl2C7/MgjA+TU2Y1DKEFOHpSWpsrufh6Stn52qV+ZdKX9LkRc2AmlocFGisUuz7lrzcZQXCWe9ILXnQwzjwy5Smu3V2H9ELr1Ryc3ZAESt87yVPNlIkgq7gnA9lFf3gA/kgm9HykneclDkUQzg+eOh9xt4W7iNg+KzODNVsuwAZKgZkxaJ8dR8z8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBsvIovf8WuCPxc+FQPoqTvV2a+KdksvuXexX6TeUeo=;
 b=b7BlgidJqzvvH0tBx5IK2fc5pyHadte88p8/BT78QPLoBFZrG0as6bsQ3MVL1O/+r/ccuSluKFbw7/tKygoO3U4wGfFvNE2rIdo8a9Mcod5G23vDlTfkvez2zLWsPkxkneSy9a7iUKtrXWC1P9dk+/Le8b1i4ztwkz64fjELEmj8wTRB5PZfe4p2DPAEfokIV/Q96VcmowpbTx8WRC2Gn7YDBbMHfZWXtlDOYEh5YcGyzIiT5isnvaEDCL752fE4g+1CR6G4xB8sPQ9eEWT0Y79m0eY7KO29iwVq9TLJfgHil3oKTzmXWC/l9j8r9VFWOAmSWZhwJrAd8lbwWGHMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBsvIovf8WuCPxc+FQPoqTvV2a+KdksvuXexX6TeUeo=;
 b=1+jPu0T7SkZOq53W9OMEE8RhQXGd7kxySbOwuzfk1ig74nCyeYbD5fJDfH2iis68FTK6bg8rk2ZQtAMUfsIDZK6ymoUrZvHI1Z8GoPui1o07WLjEyIgyMjfm6YQukc+yXyuL8eHjlOK9NCtYw9QBEoArBpDsp4Qo1h43OC8RbDw=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3952.namprd12.prod.outlook.com (2603:10b6:208:164::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 29 Jul
 2020 15:33:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 15:33:58 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
Thread-Topic: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
Thread-Index: AQHWZbLAdrp11VXrm0ybkP64nkDMG6kerxeAgAAA3V8=
Date: Wed, 29 Jul 2020 15:33:58 +0000
Message-ID: <9b384c46-ec71-46be-ac60-1335e9682c05@email.android.com>
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>,
 <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>,
 <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2a02:908:1252:fb60:a9b1:7286:e493:7e98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5add2e1-0164-4fcf-bd6f-08d833d4cfc1
x-ms-traffictypediagnostic: MN2PR12MB3952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB395225DAEEE53D810041660483700@MN2PR12MB3952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6eLwURQZxcGxKMocp06qZ0iA8GJuoimFjXJP3yKN/vi8/ZLoX8D8GlPpUrmB/+Vut3cdY7h8FASyc4Zs2NY/I8bUGtywHi58d1P34icMj/AoprCNQ1Jpbr8Ooo8VkoSLo36rL3IqmxrjpRGVDtRjYUuy5hXwP4m+oIIi3SwDX7Bu1/CgEpUPVjqkWF6NVpCc6+OWEOdWOG425pk3jn32LZqS/q6K51URglio3vVDXQIpPI6yTr3dXE7acfkI8CP64n7m7NglfzXWjJvsyUOKTi5nw3+yj0vZ825CIWSqXGSaJcGOhXkVzjxW/44xuqu3VPls/3XkDx66isR357K1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(6486002)(478600001)(86362001)(66446008)(5660300002)(6636002)(19627405001)(316002)(8936002)(9686003)(6512007)(4326008)(71200400001)(186003)(450100002)(31686004)(76116006)(66946007)(53546011)(83380400001)(31696002)(6506007)(6862004)(8676002)(2906002)(66574015)(64756008)(54906003)(91956017)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fIYUbEVumqlXieb0nPIiVWC0MJ+EhnImEa3FUYPKxtYfsRjeQFm0nKck0KCptTwUGKMr51vRzh0ve8fCH42aTH9DkFRlbSwx1/klibT1ZeEZYwDKgWfqHir6CZNIU5BGDJR4NrABhb0lhFu/LbcEkT1KOfNvotsrwpW+ldBai27VGmw+3b0kEHtOKv/eVkapdWth3BTSglJn+CvFLM/gtW38Tvo+sk49a0ZCN88DwGjpyiXPqEUopIOX4Q+0B3xSk8h1qeBN0Thn6aTWOtmdmdNfiFNpPk15QaK/7a8dGdS2BpIOUR/1sDNuBsYWUB6mxTSMZ85rFCbxQ1BqD4K2F+WXSKWczRixooJs3XOXlytmF9zwBIMXw2LaKFLdQ/n5P8nPrujIlIzYMoW+C7ogEgorMRSbCrAx002J3n/1q4ExcBh61ucJq2cqZsiOOfQKpkQZPXUAv63ItT8N8J4owZOJrgdrE8prG6sfK5iftJ67HcDWj/etGhAIvIgbtQw9gDw9EvvaVtmnspqnCxNv8bsZSEIIs7JVXQ/xDAqJ9XPl3dIy1fIyMWzFwgsti/JeylhFfEQU4kn21WQ2aFYwnJjmkdep4Fx/BcXtl9obeAK0XTP4Wk98ZcE29rYxzmkdgaAxuhH6ib2zej/ptdKVTJDpCb4g9jZjZ5p7e4FrtZtuR/qYJUl6dNU9tNe5JR0IIxPTHypdKfx7i7xyz1YvjA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5add2e1-0164-4fcf-bd6f-08d833d4cfc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 15:33:58.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jdIHx37vStvWVG8/A56ehx+GPfX5wv85N0rq81P9JdolXzqMw5SU4626m46sSmm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3952
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Morichetti,
 Laurent" <Laurent.Morichetti@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0028915307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0028915307==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_9b384c46ec7146beac601335e9682c05emailandroidcom_"

--_000_9b384c46ec7146beac601335e9682c05emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sure.

Christian.

Am 29.07.2020 17:30 schrieb "Deucher, Alexander" <Alexander.Deucher@amd.com=
>:

[AMD Public Use]

Christian, Can you cc stable when you apply it to drm-misc?

Alex
________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Wednesday, July 29, 2020 10:15 AM
To: Koenig, Christian <Christian.Koenig@amd.com>; dri-devel@lists.freedeskt=
op.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com=
>
Cc: Morichetti, Laurent <Laurent.Morichetti@amd.com>
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in ttm_=
bo_vm_access

Am 2020-07-29 um 4:08 a.m. schrieb Christian K=F6nig:
> Am 28.07.20 um 20:27 schrieb Felix Kuehling:
>> VMAs with a pg_offs that's offset from the start of the vma_node need
>> to adjust the offset within the BO accordingly. This matches the
>> offset calculation in ttm_bo_vm_fault_reserved.
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Tested-by: Laurent Morichetti <laurent.morichetti@amd.com>
>
> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>
> Going to pick that up for inclusion in drm-misc-next.

Thanks. I'll submit it to amd-staging-drm-next so it makes its way into
our DKMS branch quickly.

Alex, would you push this to drm-fixes?

Regards,
  Felix


>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 389128b8c4dd..60b41447bec8 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -405,8 +405,10 @@ static int ttm_bo_vm_access_kmap(struct
>> ttm_buffer_object *bo,
>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>                void *buf, int len, int write)
>>   {
>> -    unsigned long offset =3D (addr) - vma->vm_start;
>>       struct ttm_buffer_object *bo =3D vma->vm_private_data;
>> +    unsigned long offset =3D (addr) - vma->vm_start +
>> +        ((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>> +         << PAGE_SHIFT);
>>       int ret;
>>         if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->num_pages)
>

--_000_9b384c46ec7146beac601335e9682c05emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta content=3D"text/html; charset=3Diso-8859-1">
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
</head>
<body dir=3D"ltr">
<div dir=3D"auto">Sure.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 29.07.2020 17:30 schrieb &quot;Deucher, Alexa=
nder&quot; &lt;Alexander.Deucher@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
<div>
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#317100=
; margin:15pt">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Christian, Can you cc stable when you apply it to drm-misc?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Wednesday, July 29, 2020 10:15 AM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; dri-devel@li=
sts.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.=
freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Morichetti, Laurent &lt;Laurent.Morichetti@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs =
in ttm_bo_vm_access</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Am 2020-07-29 um 4:08 a.m. schrieb Christian K=F6n=
ig:<br>
&gt; Am 28.07.20 um 20:27 schrieb Felix Kuehling:<br>
&gt;&gt; VMAs with a pg_offs that's offset from the start of the vma_node n=
eed<br>
&gt;&gt; to adjust the offset within the BO accordingly. This matches the<b=
r>
&gt;&gt; offset calculation in ttm_bo_vm_fault_reserved.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
&gt;&gt; Tested-by: Laurent Morichetti &lt;laurent.morichetti@amd.com&gt;<b=
r>
&gt;<br>
&gt; Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
&gt;<br>
&gt; Going to pick that up for inclusion in drm-misc-next.<br>
<br>
Thanks. I'll submit it to amd-staging-drm-next so it makes its way into<br>
our DKMS branch quickly.<br>
<br>
Alex, would you push this to drm-fixes?<br>
<br>
Regards,<br>
&nbsp; Felix<br>
<br>
<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/ttm/ttm_bo_vm.c | 4 +++-<br>
&gt;&gt; &nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c<br>
&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo_vm.c<br>
&gt;&gt; index 389128b8c4dd..60b41447bec8 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c<br>
&gt;&gt; @@ -405,8 +405,10 @@ static int ttm_bo_vm_access_kmap(struct<br>
&gt;&gt; ttm_buffer_object *bo,<br>
&gt;&gt; &nbsp; int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned l=
ong addr,<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; void *buf, int len, int write)<br>
&gt;&gt; &nbsp; {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; unsigned long offset =3D (addr) - vma-&gt;vm_s=
tart;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_buffer_object *bo =3D vm=
a-&gt;vm_private_data;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; unsigned long offset =3D (addr) - vma-&gt;vm_s=
tart +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((vma-&gt;vm_pgoff - d=
rm_vma_node_start(&amp;bo-&gt;base.vma_node))<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&lt; PAGE_SH=
IFT);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len &lt; 1 || (offset + =
len) &gt;&gt; PAGE_SHIFT &gt; bo-&gt;num_pages)<br>
&gt;<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_9b384c46ec7146beac601335e9682c05emailandroidcom_--

--===============0028915307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0028915307==--
