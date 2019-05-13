Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3D1BE92
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 22:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC06789209;
	Mon, 13 May 2019 20:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C0189209;
 Mon, 13 May 2019 20:21:48 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1346.namprd12.prod.outlook.com (10.168.228.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 20:21:45 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1878.024; Mon, 13 May
 2019 20:21:45 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Jerome Glisse
 <jglisse@redhat.com>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVB2oNJpV4YZS9mkmbjza557LlUqZkyv6AgASskQCAAAwE5w==
Date: Mon, 13 May 2019 20:21:45 +0000
Message-ID: <BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>,
 <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
In-Reply-To: <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60085c00-4007-4e74-8187-08d6d7e09eb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1346; 
x-ms-traffictypediagnostic: BN6PR12MB1346:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR12MB1346AD8FACB6699B105CE1DCF70F0@BN6PR12MB1346.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(136003)(39860400002)(346002)(189003)(199004)(99286004)(66946007)(66476007)(6306002)(73956011)(76116006)(446003)(9686003)(236005)(8936002)(5660300002)(55016002)(7736002)(105004)(66446008)(64756008)(3846002)(66556008)(54896002)(316002)(2906002)(476003)(26005)(66574012)(53546011)(186003)(6506007)(7696005)(11346002)(76176011)(6436002)(86362001)(102836004)(71200400001)(4326008)(66066001)(25786009)(6116002)(54906003)(486006)(68736007)(8676002)(81166006)(52536014)(71190400001)(81156014)(478600001)(110136005)(74316002)(72206003)(14444005)(229853002)(53936002)(33656002)(19627405001)(256004)(966005)(6246003)(14454004)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1346;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1nO0CFP/4aWYFCp0IazUJZ+VQPgVxteUY5s3FSVIHG4Sw+3xswZvIpJY1C1genH3jpJf+H5/bGtYFVTTSvZijphirJDF8blRlbmkXbwajt5xdVfauRUtGnupjSofSbmyJ6Yb5mEomVbXpYAQAD41eZT/Il2ML5rGblm6PFcZA2GLyskZEdt4o1kq77dLdgXtgOFQnPfW7+xptTFIJqr24LzgB4hXM2SLW6BJePJjZaB/SBBnOhgqhScFOUo/AfUMmGdokTUV0q7Pxu1dMk+Fc0ADIxr2Zy6xPJMf8Iy4+SeEWpiHzglpWuRz0KpqXUQT9OX095KIgI28ZfrLr4h8lhyExnS4Q12k41lquTuu8bm2PV+Yb3ZP2DYkJDtDgUCyoFlIg/3IH/JflXDV4g0M0GYgXEU1Mg7VL7bVkhUOpOk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60085c00-4007-4e74-8187-08d6d7e09eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 20:21:45.3295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdxiQKSrrmaWxwrq7RGlXrDnj2CdLeEzvCViF9BTZD0=;
 b=qBCHh27Z/pAGZFoMs2iFozR4Zii++7JOq4q8Qn7wagGgIzOFWMWNp9IV5q0WDKdu6ExvFyW+XWJOVDXVNvwLbzqibzAwR2WzO+UlFvnIg9MZOSyYHXqWx1Nht7qdrqt8wkexaYLmbIKUWAIHpIY+ejNdDWdcQamsMA5Mlbjmg9k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0797123025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0797123025==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I reverted all the amdgpu HMM patches for 5.2 because they also depended on=
 this patch:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Ddrm-next-5.2-wip&id=
=3Dce05ef71564f7cbe270cd4337c36ee720ea534db
which did not have a clear line of sight for 5.2 either.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kuehling=
, Felix <Felix.Kuehling@amd.com>
Sent: Monday, May 13, 2019 3:36 PM
To: Jerome Glisse
Cc: linux-mm@kvack.org; airlied@gmail.com; amd-gfx@lists.freedesktop.org; d=
ri-devel@lists.freedesktop.org; alex.deucher@amd.com
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for non-bl=
ocking

[CAUTION: External Email]

Hi Jerome,

Do you want me to push the patches to your branch? Or are you going to
apply them yourself?

Is your hmm-5.2-v3 branch going to make it into Linux 5.2? If so, do you
know when? I'd like to coordinate with Dave Airlie so that we can also
get that update into a drm-next branch soon.

I see that Linus merged Dave's pull request for Linux 5.2, which
includes the first changes in amdgpu using HMM. They're currently broken
without these two patches.

Thanks,
   Felix

On 2019-05-10 4:14 p.m., Jerome Glisse wrote:
> [CAUTION: External Email]
>
> On Fri, May 10, 2019 at 07:53:24PM +0000, Kuehling, Felix wrote:
>> Don't set this flag by default in hmm_vma_do_fault. It is set
>> conditionally just a few lines below. Setting it unconditionally
>> can lead to handle_mm_fault doing a non-blocking fault, returning
>> -EBUSY and unlocking mmap_sem unexpectedly.
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>
>
>> ---
>>   mm/hmm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/hmm.c b/mm/hmm.c
>> index b65c27d5c119..3c4f1d62202f 100644
>> --- a/mm/hmm.c
>> +++ b/mm/hmm.c
>> @@ -339,7 +339,7 @@ struct hmm_vma_walk {
>>   static int hmm_vma_do_fault(struct mm_walk *walk, unsigned long addr,
>>                            bool write_fault, uint64_t *pfn)
>>   {
>> -     unsigned int flags =3D FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_REMOTE;
>> +     unsigned int flags =3D FAULT_FLAG_REMOTE;
>>        struct hmm_vma_walk *hmm_vma_walk =3D walk->private;
>>        struct hmm_range *range =3D hmm_vma_walk->range;
>>        struct vm_area_struct *vma =3D walk->vma;
>> --
>> 2.17.1
>>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0BN6PR12MB1809namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I reverted all the amdgpu HMM patches for 5.2 because they also depended on=
 this patch:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Ddrm-next-5=
.2-wip&amp;id=3Dce05ef71564f7cbe270cd4337c36ee720ea534db" id=3D"LPlnk921619=
">https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Ddrm-next-5.2-wip&am=
p;id=3Dce05ef71564f7cbe270cd4337c36ee720ea534db</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
which did not have a clear line of sight for 5.2 either.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kuehling, Felix &lt;Felix.Kue=
hling@amd.com&gt;<br>
<b>Sent:</b> Monday, May 13, 2019 3:36 PM<br>
<b>To:</b> Jerome Glisse<br>
<b>Cc:</b> linux-mm@kvack.org; airlied@gmail.com; amd-gfx@lists.freedesktop=
.org; dri-devel@lists.freedesktop.org; alex.deucher@amd.com<br>
<b>Subject:</b> Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for=
 non-blocking</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Hi Jerome,<br>
<br>
Do you want me to push the patches to your branch? Or are you going to<br>
apply them yourself?<br>
<br>
Is your hmm-5.2-v3 branch going to make it into Linux 5.2? If so, do you<br=
>
know when? I'd like to coordinate with Dave Airlie so that we can also<br>
get that update into a drm-next branch soon.<br>
<br>
I see that Linus merged Dave's pull request for Linux 5.2, which<br>
includes the first changes in amdgpu using HMM. They're currently broken<br=
>
without these two patches.<br>
<br>
Thanks,<br>
&nbsp;&nbsp; Felix<br>
<br>
On 2019-05-10 4:14 p.m., Jerome Glisse wrote:<br>
&gt; [CAUTION: External Email]<br>
&gt;<br>
&gt; On Fri, May 10, 2019 at 07:53:24PM &#43;0000, Kuehling, Felix wrote:<b=
r>
&gt;&gt; Don't set this flag by default in hmm_vma_do_fault. It is set<br>
&gt;&gt; conditionally just a few lines below. Setting it unconditionally<b=
r>
&gt;&gt; can lead to handle_mm_fault doing a non-blocking fault, returning<=
br>
&gt;&gt; -EBUSY and unlocking mmap_sem unexpectedly.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
&gt; Reviewed-by: J=E9r=F4me Glisse &lt;jglisse@redhat.com&gt;<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; mm/hmm.c | 2 &#43;-<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/mm/hmm.c b/mm/hmm.c<br>
&gt;&gt; index b65c27d5c119..3c4f1d62202f 100644<br>
&gt;&gt; --- a/mm/hmm.c<br>
&gt;&gt; &#43;&#43;&#43; b/mm/hmm.c<br>
&gt;&gt; @@ -339,7 &#43;339,7 @@ struct hmm_vma_walk {<br>
&gt;&gt;&nbsp;&nbsp; static int hmm_vma_do_fault(struct mm_walk *walk, unsi=
gned long addr,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; bool write_fault, uint64_t *pfn)<br>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; unsigned int flags =3D FAULT_FLAG_ALLOW_=
RETRY | FAULT_FLAG_REMOTE;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int flags =3D FAULT_FLAG_RE=
MOTE;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hmm_vma_walk *hmm=
_vma_walk =3D walk-&gt;private;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hmm_range *range =
=3D hmm_vma_walk-&gt;range;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vm_area_struct *v=
ma =3D walk-&gt;vma;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0BN6PR12MB1809namp_--

--===============0797123025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0797123025==--
