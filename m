Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471A25C1F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 05:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E3896B0;
	Wed, 22 May 2019 03:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED2E89654;
 Wed, 22 May 2019 03:21:21 +0000 (UTC)
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3418.namprd12.prod.outlook.com (20.178.198.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 03:21:16 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::2c9b:7930:7865:78bd]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::2c9b:7930:7865:78bd%6]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 03:21:16 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "ast@kernel.org" <ast@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>, "davem@davemloft.net"
 <davem@davemloft.net>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "kafai@fb.com" <kafai@fb.com>,
 "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "Zeng, Oak" <Oak.Zeng@amd.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, "rex.zhu@amd.com" <rex.zhu@amd.com>,
 "songliubraving@fb.com" <songliubraving@fb.com>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "yhs@fb.com" <yhs@fb.com>, "yoshfuji@linux-ipv6.org"
 <yoshfuji@linux-ipv6.org>
Subject: Re: WARNING: locking bug in inet_autobind
Thread-Topic: WARNING: locking bug in inet_autobind
Thread-Index: AQHVEEyxr8BJKSjlPU2LqA8J24j7dKZ2edYB
Date: Wed, 22 May 2019 03:21:15 +0000
Message-ID: <DM6PR12MB27788B3B39A41027C62CEF5EF0000@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <00000000000033a0120588fac894@google.com>,
 <0000000000008b645c058971629b@google.com>
In-Reply-To: <0000000000008b645c058971629b@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc6d9e58-5bec-48a6-7471-08d6de648ce7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3418; 
x-ms-traffictypediagnostic: DM6PR12MB3418:
x-ms-exchange-purlcount: 7
x-microsoft-antispam-prvs: <DM6PR12MB3418EA0394235FCD2EB6B85BF0000@DM6PR12MB3418.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(26005)(86362001)(33656002)(186003)(105004)(7736002)(8676002)(66066001)(68736007)(8936002)(81156014)(81166006)(19627405001)(316002)(2501003)(6506007)(53546011)(110136005)(76176011)(606006)(102836004)(6116002)(7696005)(236005)(478600001)(966005)(72206003)(3846002)(2906002)(229853002)(99286004)(9686003)(2201001)(25786009)(446003)(14444005)(71200400001)(256004)(7416002)(71190400001)(66946007)(486006)(5660300002)(76116006)(53936002)(55016002)(476003)(66476007)(66556008)(74316002)(54896002)(64756008)(52536014)(6246003)(14454004)(6436002)(66446008)(6306002)(73956011)(11346002)(921003)(99710200001)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3418;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PiQrcbLfzCHeF3omThaKe+orqtlvogRD3R239X1Zu8KM3Lu4BdnmPLv6ahgEMLE/FyPTFIxadLtIH7yarlExrzfsDr0TVWGEJca9PEGGRko77QPGejBb5UDy3x8pShxcAcfX0G5pFfEe1ZmEKmzvw9hOJf7i4kFz0WfLl60vW42sEmxtowDUzDGdK6X08eSZtp7osL+Zj1On1zdaQIMWd2/iVvWhGvJHTF+iuFBu28WUGyR+jWZESQyDrCQmannIz0zi/vuJnOUB+FJaB6/DBkxPq5DHsBIhfpdgCngRcHLg+nobAYzQLv0E0xwgR78rNglOZjesqzRZIznr9oJTCBoNucvT4BnXM4ID/UoWPsu3VmUH/CmTd3kmfVsijJRAjQF9iJLWz0uJ46x4I7qrwhtX8ORQ1F+lJWvi/RFp2xs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6d9e58-5bec-48a6-7471-08d6de648ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 03:21:15.8830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3418
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbkbfdceHizFRC2hgkRWgB8wkIUSqfJ3Ob/rhqlOyYc=;
 b=iDvDsyS4w6XeuVFEhOHfGObq6eZIofVs3DKDgBgpyZ/LzXROR4/1TskcmG+9f9q02VLhVHw0VceqvW+RCeSmnmOlPvpB5jd2rr0ZVPyh0ilApr4JS2i1Yms5hcLYonAf7tNsl5GQtxWB44sOMsG0fa+rVHvkoWqZME7zk20PRk0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0427692288=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0427692288==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB27788B3B39A41027C62CEF5EF0000DM6PR12MB2778namp_"

--_000_DM6PR12MB27788B3B39A41027C62CEF5EF0000DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This commit was reverted later. I guess the revert was probably not picked =
up properly.

Regards,
Yong
________________________________
From: syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>
Sent: Tuesday, May 21, 2019 11:16 PM
To: Zhao, Yong; airlied@linux.ie; Deucher, Alexander; amd-gfx@lists.freedes=
ktop.org; ast@kernel.org; bpf@vger.kernel.org; Koenig, Christian; daniel@ff=
wll.ch; daniel@iogearbox.net; davem@davemloft.net; Zhou, David(ChunMing); d=
ri-devel@lists.freedesktop.org; Quan, Evan; Kuehling, Felix; Wentland, Harr=
y; kafai@fb.com; kuznet@ms2.inr.ac.ru; linux-kernel@vger.kernel.org; netdev=
@vger.kernel.org; Zeng, Oak; Huang, Ray; rex.zhu@amd.com; songliubraving@fb=
.com; syzkaller-bugs@googlegroups.com; yhs@fb.com; Zhao, Yong; yoshfuji@lin=
ux-ipv6.org
Subject: Re: WARNING: locking bug in inet_autobind

[CAUTION: External Email]

syzbot has bisected this bug to:

commit c0d9271ecbd891cdeb0fad1edcdd99ee717a655f
Author: Yong Zhao <Yong.Zhao@amd.com>
Date:   Fri Feb 1 23:36:21 2019 +0000

     drm/amdgpu: Delete user queue doorbell variables

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1433ece4a000=
00
start commit:   f49aa1de Merge tag 'for-5.2-rc1-tag' of git://git.kernel.o.=
.
git tree:       net-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=3D1633ece4a000=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1233ece4a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dfc045131472947d=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D94cc2a66fc228b23f=
360
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D163731f8a0000=
0

Reported-by: syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com
Fixes: c0d9271ecbd8 ("drm/amdgpu: Delete user queue doorbell variables")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n

--_000_DM6PR12MB27788B3B39A41027C62CEF5EF0000DM6PR12MB2778namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This commit was reverted later. I guess the revert was probably not picked =
up properly.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yong</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> syzbot &lt;syzbot&#43=
;94cc2a66fc228b23f360@syzkaller.appspotmail.com&gt;<br>
<b>Sent:</b> Tuesday, May 21, 2019 11:16 PM<br>
<b>To:</b> Zhao, Yong; airlied@linux.ie; Deucher, Alexander; amd-gfx@lists.=
freedesktop.org; ast@kernel.org; bpf@vger.kernel.org; Koenig, Christian; da=
niel@ffwll.ch; daniel@iogearbox.net; davem@davemloft.net; Zhou, David(ChunM=
ing); dri-devel@lists.freedesktop.org;
 Quan, Evan; Kuehling, Felix; Wentland, Harry; kafai@fb.com; kuznet@ms2.inr=
.ac.ru; linux-kernel@vger.kernel.org; netdev@vger.kernel.org; Zeng, Oak; Hu=
ang, Ray; rex.zhu@amd.com; songliubraving@fb.com; syzkaller-bugs@googlegrou=
ps.com; yhs@fb.com; Zhao, Yong;
 yoshfuji@linux-ipv6.org<br>
<b>Subject:</b> Re: WARNING: locking bug in inet_autobind</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
syzbot has bisected this bug to:<br>
<br>
commit c0d9271ecbd891cdeb0fad1edcdd99ee717a655f<br>
Author: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
Date:&nbsp;&nbsp; Fri Feb 1 23:36:21 2019 &#43;0000<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; drm/amdgpu: Delete user queue doorbell variables<b=
r>
<br>
bisection log:&nbsp; <a href=3D"https://syzkaller.appspot.com/x/bisect.txt?=
x=3D1433ece4a00000">
https://syzkaller.appspot.com/x/bisect.txt?x=3D1433ece4a00000</a><br>
start commit:&nbsp;&nbsp; f49aa1de Merge tag 'for-5.2-rc1-tag' of git://git=
.kernel.o..<br>
git tree:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; net-next<br>
final crash:&nbsp;&nbsp;&nbsp; <a href=3D"https://syzkaller.appspot.com/x/r=
eport.txt?x=3D1633ece4a00000">
https://syzkaller.appspot.com/x/report.txt?x=3D1633ece4a00000</a><br>
console output: <a href=3D"https://syzkaller.appspot.com/x/log.txt?x=3D1233=
ece4a00000">
https://syzkaller.appspot.com/x/log.txt?x=3D1233ece4a00000</a><br>
kernel config:&nbsp; <a href=3D"https://syzkaller.appspot.com/x/.config?x=
=3Dfc045131472947d7">
https://syzkaller.appspot.com/x/.config?x=3Dfc045131472947d7</a><br>
dashboard link: <a href=3D"https://syzkaller.appspot.com/bug?extid=3D94cc2a=
66fc228b23f360">
https://syzkaller.appspot.com/bug?extid=3D94cc2a66fc228b23f360</a><br>
syz repro:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://syzkaller.appsp=
ot.com/x/repro.syz?x=3D163731f8a00000">
https://syzkaller.appspot.com/x/repro.syz?x=3D163731f8a00000</a><br>
<br>
Reported-by: syzbot&#43;94cc2a66fc228b23f360@syzkaller.appspotmail.com<br>
Fixes: c0d9271ecbd8 (&quot;drm/amdgpu: Delete user queue doorbell variables=
&quot;)<br>
<br>
For information about bisection process see: <a href=3D"https://goo.gl/tpsm=
EJ#bisection">
https://goo.gl/tpsmEJ#bisection</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB27788B3B39A41027C62CEF5EF0000DM6PR12MB2778namp_--

--===============0427692288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0427692288==--
