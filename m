Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111374BB9FD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 14:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7D510F136;
	Fri, 18 Feb 2022 13:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C710F12E;
 Fri, 18 Feb 2022 13:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=addax32AlZcuAv2EJaqRyJ45S/gtW2QbpHI0tU8ty34MaZWKD3UE0vRDZ0v+jfV4P8wia2mQAym2F9fhMV2U/f2G5+ulbxtosINbQ1v32xmML5hWBD9j4kCxyLgxZ17Wq2oSAgEWRGcdJtyQJiDdqKii58BKI66Yp3WvSM72PMd+etnBhlJEd5kLha/RVb7QzA6JH0YZA5xfTum2izDavb8gKzgotYKJiSz7eY5TH1xLFQEKGLPiJ9tj97mFHxAdb87M03ZTlo0X4uaqWBZXXZ421HHxUu9Qm3a8HdckrgFLDe60Bhn989Y0S6MlqeHJPYB/RxJTOaci2AsX7yEnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ssyxfc7Z0tRBUAhBJTXuYUDJubEeLw97FFj20vcgbPU=;
 b=mg5wKYf6YUcvQnEEw/f53qfeKNQwtK49hyGKsKM//ctbN42HLSIMdKhWgEyrqVawtaEiMuyoSB1dpLry5uz9jjjUzpF7lCaSC/xRp+kib3QKzEAp3eHM1244nj4fsZLzVSwZuNVLtmZFsX6MIMZNyqBaHqiF0kKaLjyx2pO5S+yDVRilxxzvKEkILgxEx4vAUYh3mPdoiqhmzbM+OKsRJjddjvRb27AQVJvr2a60tLVoWhlszkDwqFqyBdCXAbbiPJfFopcvmuUhqC87+Tn6mCmw7nqdM11zlqA0hvTUe7g9nes1vZBoBIhZHqChaFL5lUSjiHtIFRg0Rf24XCdr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ssyxfc7Z0tRBUAhBJTXuYUDJubEeLw97FFj20vcgbPU=;
 b=rNmi2N+VlGMVan/ercL/xxPOC+lsEzUmMg5RvQqeXe9RUbXMjned6Tu5Jm+Dq7j9IgnackJ7bf4rupFlq8C8dxIjLpnW7j7x+cHObNMJdAZNj5FSaTGKX9Nn7AUzAnN4LZMlIvaUkoCDdWt5e5uJjMawNDQTIr97nutaKwMkANw=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by CH2PR12MB3973.namprd12.prod.outlook.com (2603:10b6:610:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 13:18:08 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::d830:4d2b:3214:7c85]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::d830:4d2b:3214:7c85%7]) with mapi id 15.20.4995.022; Fri, 18 Feb 2022
 13:18:08 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] drm/amdkfd: CRIU checkpoint and restore queue mqds
Thread-Topic: [bug report] drm/amdkfd: CRIU checkpoint and restore queue mqds
Thread-Index: AQHYJJlfs99IPBvg6kSUhH2p7Pa8VqyZSoQA
Date: Fri, 18 Feb 2022 13:18:08 +0000
Message-ID: <DM6PR12MB5021E02E5B98A43364E86E9495379@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20220218072955.GA9278@kili>
In-Reply-To: <20220218072955.GA9278@kili>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d8aff8f-cfde-4e63-de48-08d9f2e11b30
x-ms-traffictypediagnostic: CH2PR12MB3973:EE_
x-microsoft-antispam-prvs: <CH2PR12MB3973D00EAAA93345990F074395379@CH2PR12MB3973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AxPaznT4H6z7pjdEQT5OrgdGG/Ot0T+X4SiaULOHV/Jz05lIn05I6Cy3sXAkJJCB2owIxSSTBYBGdrPXyxEorXyZ0DO5bNbEWz6QUxtINY3E5OzqzBINH3qfgvv/1RjBV0CqtWaaY4+4pCI/Z7oivimg+1ZgX8YrQIRbg5NwQcYSfQWBckTQ7SWv0jDx0Mp8t9xX0Gk3HMEnx2jNXctKuNU4kN4K44+iC/z2FMLL+sOIM4AdraSqfNdBO9Q/mPFuXlJYU4y5eABWNa4Ad/3PuWeAAupgBtBbV7OOeEOm4NUCJB51ubR7W8gDNzPZ7DO8zBWRR4E2/sX+lkGMTMagc25BQehmNLRF2afr4l8MHZ8uX20XWUulGWtxFJf8o+xMUnV5d+tMZWDi3HhfeteZ9bgosd0oVwzXoWbBA59x+dwtqFQCvJBDFBLkS55hk0H15aKu/HHbT059B7ouSaJKalr9CK9RoZYGf/IJuHQuLy7F85vaCCeNm9ZN+9JX5MrnA1srb6n90M3ay2NfrKXavN2l2akIn6sW9XVHCKnJkblCWaGi4D05jxXN67qoX6KQb81NvYElJoYJ/hpTn88QFInyxhd5+QN0MyXay5sTQuSK3ADnxjjfoDS8eoiVFQEaARFI2iv53+QTk0Z3COOyf7874u9/XRrFqA2n3She/9mX3p4vaOyZquQIuls8F8M+6OIWld1vaCLvnokn8+1vjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(53546011)(9686003)(6506007)(7696005)(38100700002)(316002)(508600001)(38070700005)(2906002)(86362001)(8676002)(64756008)(66476007)(122000001)(4326008)(66556008)(66946007)(76116006)(5660300002)(66446008)(52536014)(33656002)(55016003)(83380400001)(186003)(26005)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pgAly3iwp+G8aHpDqM2IFn+LgMnWQK6ILPwVQvK+aazWdmdKUbqVDAjUoywV?=
 =?us-ascii?Q?tBhDpCNpfwLuuhD+s+1VGPfDqqdI0mVTMxihe33NDUvMzmALQM9XieorQie4?=
 =?us-ascii?Q?3yp8wm9mg9ogsvZIr/KwvfHuBzr8pUqFhYs06ZTQqS7VcLcNBR2Xebml+3y7?=
 =?us-ascii?Q?ez3gBeE67tU1Do3PzTtE1rde1uz1PWr8TthkSrou1Mtz7QmOGA5OsuziThLz?=
 =?us-ascii?Q?fW6Wo00/q2AovMIUvWo3Tu4HvfnUaTvaoPYdGSefl6zSnEdsWv1V8Kgymrvw?=
 =?us-ascii?Q?0KgERqq7w34HSpmiiwr+DSeAoKvctgoNmucYx7VtIEuyqZ+KxNihttKJI13J?=
 =?us-ascii?Q?umHI69sLS/qO4UymfFrab1tHLX54xFsZlIYCkP6eVV9Y5ti/NQ506Zw+0PD/?=
 =?us-ascii?Q?CALDbkg7V/0a01UsHiREBYZbngdiW0Vp4xIfo/B2dXe89znRCInQFdSZJlzX?=
 =?us-ascii?Q?e5dc74+GTZ320zrEninGYyuc96sRNBPjVU9HcfGfmgsTcRqdonCqQinSRoV6?=
 =?us-ascii?Q?WaW4XlHB/rxHQSnUscw64Gu0t8MnxQUvcObr+vf4emMzfL3kl2UAiXX5/o6T?=
 =?us-ascii?Q?s5UlRltcWkwrLv5Jqt7rxI+2K1874AugCE7625p74+oHxJcbrjWtPXNm1Yu6?=
 =?us-ascii?Q?066ttanwckYEwnG3II+rU361TC5mWOiU8cGl7zZmtW/QTiHUhYstOC2xIyyB?=
 =?us-ascii?Q?hukglYuCXnTVL4GOYegwoe6PUgCscM5Tr6sLLLjK9R89gwoc1bSGn39v005T?=
 =?us-ascii?Q?WVEgQbZKlg7kHpX62YQFJRZLIERDbkV97MmiG+oEoKOZ+Zexm8+JDfUpkPfn?=
 =?us-ascii?Q?V8m6vfGz6CzNEkitCJCBqwyCeM3pxMFeJm/iqCiSZ5abMZt8WX0rLSg2BiOG?=
 =?us-ascii?Q?xyu+8BvRT15yUNVF+LyLS0YCVQoXD3CWnh7feyLuCksHbSiuRHvuiMNFcFet?=
 =?us-ascii?Q?HJqiMqDspFVJZcb59zzoOykD8+O70wGCS87UXYp2CPyM/ntD4wQ+UL66DWnf?=
 =?us-ascii?Q?vfqSXujKXGCL/+y2b91J8fyXolP2YORw4rja0DxXHPlcad9f7+7pBMy36RO4?=
 =?us-ascii?Q?BM5xgrWSkJ9BmRqdQt3dQL8ykNT1OaEvVcBZcZ5HrGUim+ZdvvT8k0nNl73t?=
 =?us-ascii?Q?QZLe7oaHT9IuSkq+3VhfU6dcyjMbOpChm1uJyPQUWI2RYJPVAG7gArCxUeN2?=
 =?us-ascii?Q?geTUeL/kKzdHeXhjoBv9C1gy3Za3ksCHGINfGVbR0jYzOQAC02IySDo2CEo2?=
 =?us-ascii?Q?FuUqs2w8XpWhRfkjCpjBiKyaiQG9U1Oc+9+dkw6XtLYi1oYaDxKdCXOSIUsT?=
 =?us-ascii?Q?onnRvt7omjN2DoegmahB17xxf6Ry3pW8IHGJlrkqLJKoQDdbWrYdXkvaTN6/?=
 =?us-ascii?Q?INl3rGCyM4+SOPjgD5VzEw+S67Lb7HX5fgetL4myUBd5c8Xtg/yWg2L4Euo/?=
 =?us-ascii?Q?qRIu53v4zQfr8toBp7dXOoHY5MNd9ihc41xe6sTUIae4fZurKQyhqXlOa58s?=
 =?us-ascii?Q?fHXkeCKdZgYqYgY9lEdjA0HtHYYo6sfZLVmvce/7z6Ap5xfXjVyjx+Y9gFH6?=
 =?us-ascii?Q?zCHKbh8H0Zarvc7pAmxLnIODh/GeyRGAyBJjPBaCNa4UND/p3IHK2WHznxLv?=
 =?us-ascii?Q?jNTYvLKsxlGGuzytP3VL1zc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8aff8f-cfde-4e63-de48-08d9f2e11b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:18:08.7074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcp4YhJgC971t7/kniBRndfBSH86O+KzCJ2htF4DwxNM7mgqVUAQ+o2yqiLNJApfD9W1iF6kK6hzoZ2ThrA4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3973
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,
Thank you for catching this. I will look into it and post a patch.

Regards,
David

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>=20
Sent: Friday, February 18, 2022 2:30 AM
To: Yat Sin, David <David.YatSin@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: [bug report] drm/amdkfd: CRIU checkpoint and restore queue mqds

Hello David Yat Sin,

The patch 42c6c48214b7: "drm/amdkfd: CRIU checkpoint and restore queue mqds=
" from Jan 25, 2021, leads to the following Smatch static checker warning:

	drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:344 restore_mqd(=
)
	error: 'ctl_stack_size' from user is not capped properly

drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
   762        int kfd_criu_restore_queue(struct kfd_process *p,
   763                                   uint8_t __user *user_priv_ptr,
   764                                   uint64_t *priv_data_offset,
   765                                   uint64_t max_priv_data_size)
   766        {
   767                uint8_t *mqd, *ctl_stack, *q_extra_data =3D NULL;
   768                struct kfd_criu_queue_priv_data *q_data;
   769                struct kfd_process_device *pdd;
   770                uint64_t q_extra_data_size;
   771                struct queue_properties qp;
   772                unsigned int queue_id;
   773                int ret =3D 0;
   774
   775                if (*priv_data_offset + sizeof(*q_data) > max_priv_da=
ta_size)
   776                        return -EINVAL;
   777
   778                q_data =3D kmalloc(sizeof(*q_data), GFP_KERNEL);
   779                if (!q_data)
   780                        return -ENOMEM;
   781
   782                ret =3D copy_from_user(q_data, user_priv_ptr + *priv_=
data_offset, sizeof(*q_data));
   783                if (ret) {
   784                        ret =3D -EFAULT;
   785                        goto exit;
   786                }
   787
   788                *priv_data_offset +=3D sizeof(*q_data);
   789                q_extra_data_size =3D q_data->ctl_stack_size + q_data=
->mqd_size;
                                          ^^^^^^^^^^^^^^^^^^^^^^ ctl_stack_=
size comes from the user a couple lines earlier.  It's a u32 and so is q_da=
ta->mqd_size.  This addition can have an integer overflow.

   790
   791                if (*priv_data_offset + q_extra_data_size > max_priv_=
data_size) {'
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^
Which means that this limit check doesn't work.

   792                        ret =3D -EINVAL;
   793                        goto exit;
   794                }
   795
   796                q_extra_data =3D kmalloc(q_extra_data_size, GFP_KERNE=
L);
   797                if (!q_extra_data) {
   798                        ret =3D -ENOMEM;
   799                        goto exit;
   800                }
   801
   802                ret =3D copy_from_user(q_extra_data, user_priv_ptr + =
*priv_data_offset, q_extra_data_size);
   803                if (ret) {
   804                        ret =3D -EFAULT;
   805                        goto exit;
   806                }


regards,
dan carpenter
