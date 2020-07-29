Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8370232181
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DAE6E4F4;
	Wed, 29 Jul 2020 15:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764316E4F4;
 Wed, 29 Jul 2020 15:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdhLY4PIf0gdeS28+PUW0ueum+hMkNYeoM8myF2lG6cytBm4/j7RMVIQGfOwHih7DK4AKod7aTYXfx5e+Yh5HLU2Egu70F/9hWGPcb/CeSj0/AuSpmXzdhRXwDUfR1pXIX7i2XCzfsx6DJ9BBQaK8ZKbpqlRHCqpNJzEKDcrNcAdWLX/bSO0o//I3tG4o91xgO3cof4XVKfQl21Cq+BPKFZj7PH3usoE3zD8Mls0N5plCgWZHqPQFBV+vgQ0BVJbsNCa2KLpX6eZSg8Gw7BeKo16+FBDztrLyyogxQZna9NX9fP+aiN7PDSZXv3IUKiBcHMZtO0X+me+oEAzvGyqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ1cH3EgNF9xj7bdm1jo5kfVVJDVUSWjBF6a03ura5g=;
 b=jzTzcDOwRqGeyo2u1UQ4cE4caKGt23OBUgrF+sF8i0qVyVyG8YijHq7NhQATm62BIJrUQnBmwQ9QJ7usM/bdWZlGB4KfnDZoVLrGjdPsqEulPxSqTP+bUtZdQl27vCtg0AKUf7Ov9OOdXlMKAVmuSvMGS0Q/z9ES5jdJF0izZXArCoB4RbH4pEahGvrJRLWJ4roJDY2djL8Os93e05LNK8oSavUsDCQUMqH6kRWb9K28yBCQ3KMXyT+erLVxAveew2RQodYCHrRVfD25BAL1bkGoJhxvlXKx7zqjC7WrXrbX65I2bFN9T0PkY9pyj5qRnaYBf9kZRVFieIbm0CIapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ1cH3EgNF9xj7bdm1jo5kfVVJDVUSWjBF6a03ura5g=;
 b=MTgI4uchMlJUNohTlYC6jCv7BrLwYCE6eds8MIQ1G1MRhlLYYTCgw6cyMLhsKZnPVW3Kb+LoQ+NVsXfF1BfP6jrGH86Etkedrw0Q1RagfqkoQG7UNXFtxU3p0bkwVgRczdBMorMirw+13GKFo2uIR/OsLH/wxr8N/mux4KM9lHM=
Received: from MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18)
 by MWHPR1201MB0109.namprd12.prod.outlook.com (2603:10b6:301:52::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 29 Jul
 2020 15:30:53 +0000
Received: from MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::d1a6:5567:82c8:34ad]) by MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::d1a6:5567:82c8:34ad%4]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 15:30:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
Thread-Topic: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
Thread-Index: AQHWZQzg/0f2XkMZ0UGxMjNXKfqe66keNNMAgABmkICAABTaog==
Date: Wed, 29 Jul 2020 15:30:53 +0000
Message-ID: <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>,
 <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
In-Reply-To: <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-29T15:30:52.520Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.219.66.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4bc9766b-ed0c-41bb-66a7-08d833d4615d
x-ms-traffictypediagnostic: MWHPR1201MB0109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB01097D748353885C8C6A0450F7700@MWHPR1201MB0109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D48X+5gybgXMu4k7LhgjRSm5HcZe2o39a1PwNJ96kJxiQ586VEGdt6Vsy4Vl/LsGUEqEZukd8dS3ehUKfyXgiz8EEVUKX6mZh2DIuuhaWdTh/8DIP4eDB6OC9ucltUX9EENcubF8NbIuV3sW0Gw/WWQUxOqc3ll2OTJGUgPRpXBE0zXkJtC+TebXCvz2b0kbin3k2BnYR0djN+INqjaLTVQgmWjui2OqksTLR92bS2fbHX6p4Rp+0WkrPjElHjqyQrz2vbod4yu4bCXQNapkzQxO/R3AlkX1RgBiY4W9F1Hdr3iJ96zd8Hk0JyOK1e5RSIRgjcHZ11jATjCx5iCgRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(83380400001)(33656002)(19627405001)(110136005)(2906002)(8936002)(8676002)(6506007)(186003)(66574015)(66476007)(64756008)(66446008)(76116006)(52536014)(498600001)(66556008)(71200400001)(66946007)(9686003)(86362001)(4326008)(7696005)(55016002)(53546011)(26005)(450100002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: clS2kgcSD7A8wyiIzUE8ieIgXB1wPFzG2XHfwbwxKc4ayMWJ3vn/e+pK42GJsn+BYZkwEBizAZg4NVkfnDbrf92dPTtnabK136763W1rnbWCRxG1SFts94IjDD+XkABFy/wwTj0bngMLp8ny0dUCios9Kjie8tGKI1sbkUmGxzKRCQSGCrIuhVEed9hCsSseElpCC/ZoHUbnNKY32QJ9KCb930E9X7m53SmQexy+cm6u1iFPtLznDet049QS6jOrG7OxOydMsSY62rKfKQhaRvGdIr4tkcGyg7AeV4P9zNcVyzxEiFXYS7gNyRvQXbxWDXoUkxna9Z2Wj1DhpHlctMp8WE9SU2H6v9A3md2InBxqVJCuwJwV1sN+30DBGAo/Kt0WSS2p3XOaPIY1/WfI3V1oJ7R0Jab2mQS2oj1DLElT/AWU8JbSPgcIAcSQGsVf+T9D29boO+KxeNo6Jzip7QcEDL/YDCaJ9XZheOw2HBaZm4BUsE+hqg8V9Zcxe1NpalymuSz4LCBcP39vEO6e++f+IdbjIvIel74oAmLYdZa+jansrlZtRIHZ9iMr+xuUNNl76oWb9FwZc48PxfesNKL9Qevx/7F49PAbqRXfb+gp4J3Y+YYOHxblzkFLY6T62UmT2pvJzirOoR3vzbomhA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc9766b-ed0c-41bb-66a7-08d833d4615d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 15:30:53.1175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ICkzUEfKC/+TrcjG6WEExxO4G98OkBEnhOe0a/bPDycVtH1JvRdPs0EHJGccgWYcJbEfVGlP4/dD0pPR8FjlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0109
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
Cc: "Morichetti, Laurent" <Laurent.Morichetti@amd.com>
Content-Type: multipart/mixed; boundary="===============0633394355=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0633394355==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB4491D68CC4AEC80F9B724E46F7700MW3PR12MB4491namp_"

--_000_MW3PR12MB4491D68CC4AEC80F9B724E46F7700MW3PR12MB4491namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

--_000_MW3PR12MB4491D68CC4AEC80F9B724E46F7700MW3PR12MB4491namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Christian, Can you cc stable when you apply it to drm-misc?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
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
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
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
</body>
</html>

--_000_MW3PR12MB4491D68CC4AEC80F9B724E46F7700MW3PR12MB4491namp_--

--===============0633394355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0633394355==--
