Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC54A8628
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7010FB4B;
	Thu,  3 Feb 2022 14:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35A810FA9B;
 Thu,  3 Feb 2022 14:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deehC7uw6JN4PsksJ1uHK0yaDSISZG20X7es9yW3XrcKvSej28fQcU9Z9OJ+j14+pRAcig6d87TXwaLh17jdyi3YYJ3YBHaZUbHDt8tV406V9sgHYysfumso67BDPksR7VInXXNCiBXBwMDQUykvQ8Xe05JhnvYd/3WH9XU4h4lwYqMKg7zR9hb5uI72qOjv1U24PnoRzVLqsgIqMuQBjMoomWeYxycOgeePn0MSE07PP4TVEFRX/vnRwwq9XpyzsxTbHK5230HcI33fu62SzGW5DVriBNUmO+v3h49grtUuIKDAVQIlKzL1+pkhtX1FYfFdeMKD6SZbS7kjNOOK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oqEhnYll/8jgpLEgq6jgifclPvXxdeEQX6UKjO4lJg=;
 b=SvmCu4JvZAQiwVkjcs1mZyShEkj8r7m2MIaM5zanLpYa07WbiwReM5rW+Xyomay640BtkWl58bTOkO3CFHx4RwWiy/3ItNpBvTzGuPDnnu8WB3DXoTEOdUw5kmMx7olOexveIS2sTdk1+swH9J0YVLC1qyWa4arxg9KQWkAGjPj+3gsQrVKKiWiIIKopBiM+aZAGRRlsfTuQbMbFtxxpsqIlfxJ9AGwKFhREJcFesnvknb6XGDL11fTkJiYdNSzCzSRA+yt4lHNsvkWK3j8ANrbTihnt41J4veFoyhYsdVzOgSbx5tUEsOk2EOwNeh0PkkhcjQAkS12L9W2JFSM1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oqEhnYll/8jgpLEgq6jgifclPvXxdeEQX6UKjO4lJg=;
 b=oaO/9S1nVWV4daR7z/LT17f+W8Rog5JR8UaNnB3dkTz76SU/161wpti4eLBc9okLkNaXOZ8wei1FOR/39XEq4j8/alYqI4Pn1yoYSeaa2LvVm5sHfCFfU5GmB3mLmFs0Q0+n5941GnoAVKFIxge/DD5Ihb3o33qsrLTJaquQss0=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by BN6PR12MB1556.namprd12.prod.outlook.com (2603:10b6:405:4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 14:25:20 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::d830:4d2b:3214:7c85]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::d830:4d2b:3214:7c85%7]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:25:20 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [Patch v5 15/24] drm/amdkfd: CRIU implement gpu_id remapping
Thread-Topic: [Patch v5 15/24] drm/amdkfd: CRIU implement gpu_id remapping
Thread-Index: AQHYGN3J7YTC5cu+1k2WId0tJG+aaKyB4Z2g
Date: Thu, 3 Feb 2022 14:25:20 +0000
Message-ID: <DM6PR12MB5021059600E46A74A7CAE0AD95289@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
 <20220203090918.11520-16-rajneesh.bhardwaj@amd.com>
In-Reply-To: <20220203090918.11520-16-rajneesh.bhardwaj@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02dfcb83-4930-4209-2973-08d9e72101e5
x-ms-traffictypediagnostic: BN6PR12MB1556:EE_
x-microsoft-antispam-prvs: <BN6PR12MB15569CAC863BE7483B27331F95289@BN6PR12MB1556.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tokBsikySOWbb5pGHZbMv1vi0KxIaa2JkPBR28W9Pmd/ZwA4LU5fxjREEv6PV5UzhPmA1ggQ/P2Jk/jX6GKZSIS90H6+CBaEVXQX3pqL51LaU+Q775Wnndw+S8X1IHEq4JBs4F1XRaSD7EmsTALYwNeXPi2VgLFwIUpox33NFHY8QpvJatn5EA0AAJxY7KNr9obzLNOD4DeSdlWk4QTcZuAvYpCqA2NC0knF44sY3z2+vwk8XPtA2y7XskiDKf7HjMtutZZMXqgqPjC55F4NnHpyvGMlQvqs9xDrDNlJ7mAUfeucFeDrRLlZDNofzdzcJE8doDAmz3NFolntt6YYpwwr4SykbXQJct/O4LhPW+CET9w5lmcxgJ9ApTu1qG3VGDUqnJZDlF3Q99FrBNKuzAMSB9NW7/0KzOzRRju9jYRCfm1j+z2CA7ia1VHKB0G2roeRuhlIgsQL0TthIY+kNYDlXL7NzqtyvvrxCITWnGLeTZtrN/ZIB/StfPKQ61ps2T/t7L/g/m1BNm+GFC4ZyQJBGoUfVmhIaZHkvZWWuAVhuwKAoLdCzX9LkTnmxHjkn5PVBfvaReYRrJoOGGQ5wQiJHwRaH3srpd7JB9EJbWtRkXRGoNBWc+g8i1fHlQj/I0MyLgilw7EJHykYgMDzr1blMJJE1QX7sw7CkZdxXDDdleNnajAwEzQ+58cuLsPHa1NITT9B95ky1+X074KR5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(52536014)(5660300002)(9686003)(54906003)(110136005)(508600001)(71200400001)(6506007)(7696005)(76116006)(450100002)(4326008)(66476007)(8936002)(66946007)(66556008)(64756008)(83380400001)(66446008)(26005)(186003)(316002)(55016003)(86362001)(38070700005)(8676002)(38100700002)(122000001)(2906002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bSc/vTFRuqoUh2DtgcgxQ78ZU0d4jFz4Gokl2cMV1HvBAKBXh2BSVKVA/ISK?=
 =?us-ascii?Q?2UQ8Dk6t/hbVKwJpoLuuTtRPhSTsHH3risnFejDoD1Pmj0P2st6jHeSMuC+W?=
 =?us-ascii?Q?Sp+z39o3STMSZLqE8smxEQO8yXE2fmfEj4XmXFjiSFXjc1l5TTmui1Ton1aS?=
 =?us-ascii?Q?g0RrDVungL3c/1JjIhctK6Bv0OPypLx8waysJ8x1NGcu4qp233PH3aXgQDBU?=
 =?us-ascii?Q?xR21Yezp/y8jOyGBw6vfjtspQ4JcNemyst7ljMSXE8ld4WNdUchjiSAW8K3/?=
 =?us-ascii?Q?F8KXUy95J2ERwMfrO9j4WfJoFyLK/SVKTGb5jiwIfq2Cdh0UUSYsoFR8b2QP?=
 =?us-ascii?Q?RAKc/kzjlG3Rr3s/4DTJ2/NOfdsa4bnrWLWFEdfGA0IUMXpB+3MvcqAg4Mfo?=
 =?us-ascii?Q?M158hirJxNEN5G31x61yEENMZki4XRuTHpAgySU7DET7g5HTZ4HIjq9YFl5O?=
 =?us-ascii?Q?5dNATdDSvUYlTfhNgWqH//F9BUleCMHGD7RFnmFSXs7tCdJxSJl0K6bmcU+B?=
 =?us-ascii?Q?p/34oXb52iyhE+/9+22c9LZSoKCFdT+5rda9xIb+Jx4rRMVJmQjzT+QDI5l7?=
 =?us-ascii?Q?bEG6Co4NeJUJUQQaWvO1btu644WsWn6gCv9etwvIl2uEIN1ZAc0mE5marI+N?=
 =?us-ascii?Q?9mBl2KElejOvppHSPqT9h4B5QZ+O0xHbRUAiEHgj1WZoc22wXEsjT6q8jVCr?=
 =?us-ascii?Q?8WTJBSCUZb1HSvb1ZiYSmDSHT1ZQNe1T3OoDVGEX7sVjDuQa4kIGCJYVZe1p?=
 =?us-ascii?Q?WpMjZ1leHHQHJMI21RVsuIasi2ri4Pk6RGBOntPlNP02Hg39BjAw/B1ZW4Jq?=
 =?us-ascii?Q?p4OIT0xJVSnJAVdIdHoC1g9EOkp3Bv2LmZQPaWxcK8DuUbKNYLDEm6VKNvIr?=
 =?us-ascii?Q?au4ivKnmvia7PL+68M4VsGh7aIzPmDwML+JKPr5+gYZPjf6OzLEFsSIQs2ne?=
 =?us-ascii?Q?1EZb2LMp63deKh1S60AEh3N/2S+htPw+hYfHaN0jXG2tFHc5Oa82SywnaFdR?=
 =?us-ascii?Q?SfCEu0HC6xZFbVDyJS3lbFjas5IllEhlhRQUeiiXIDI+SrBCc9FarR1+CR9l?=
 =?us-ascii?Q?FN8imwpYJByTThEB7pLK28xo31PBnZkaXO58UIX8U1SeZa1EvRnX+qePExVQ?=
 =?us-ascii?Q?p+Flit3kYSkdHxbf0gHkCOVwQ2uFmbI/P1iOw9zKtNeUaxoPj8sMxh/cjXHq?=
 =?us-ascii?Q?xdRdJfAjSxJE56im4th+dz+LwAJtVv9Lz8i0x4uG86jhYBEJQWmXMsm94wNx?=
 =?us-ascii?Q?B78b5exYV+gnL/jDXpm5yRZDdC8LTR6FizdWi6r0XIP0GTbZ5cigLij8Bm7n?=
 =?us-ascii?Q?hVrDqStIM9OK+ckU4gasEsSxFY0KEmObU1P6HrLeKo+vPgKvIlHgDkF0Q+YV?=
 =?us-ascii?Q?WjGjAVFAUoUgT8dztN7D1GNgTRrzXOnySgp/l1n2qE3aVRLIvC/by42LjSu4?=
 =?us-ascii?Q?4dwxwfKu2Ueki3+/IX1c8XcDqDuefA/2tZsWqx5CLkMV6RsEMCCXNTuk779G?=
 =?us-ascii?Q?RpWMsOrjahp37CN6bQOz1EEtr7RmUQM/Eoq9VzhSjNEQ7vlPe0iuMV3VSK4Z?=
 =?us-ascii?Q?x69AtqabuFNqfla0mNs7LRhd3V2eaO9nrMXAFB239ygfzBbUqrtCJumDIGkN?=
 =?us-ascii?Q?BrsKVFSFgarqf5Gz/uJshzU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dfcb83-4930-4209-2973-08d9e72101e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:25:20.0274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZYtsnQWkjUCcIQO3bTa6k/aLlG2AKGzN3++FwCR6lbgckGU09mRF/4fzje5QOgbRcQRKy874y3ERnmWyTGICw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1556
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One nit pick.
Regards,
David


@@ -673,15 +693,19 @@ static int kfd_ioctl_dbg_address_watch(struct file *f=
ilep,
=20
 	memset((void *) &aw_info, 0, sizeof(struct dbg_address_watch_info));
=20
-	dev =3D kfd_device_by_id(args->gpu_id);
-	if (!dev)
+	mutex_lock(&p->mutex);
+	pdd =3D kfd_process_device_data_by_id(p, args->gpu_id);
+	mutex_unlock(&p->mutex);
+	if (!pdd) {
+		pr_debug("Could not find gpu id 0x%x\n", args->gpu_id);
 		return -EINVAL;
+	}
+	dev =3D pdd->dev;
=20
 	if (dev->adev->asic_type =3D=3D CHIP_CARRIZO) {
 		pr_debug("kfd_ioctl_dbg_wave_control not supported on CZ\n");
 		return -EINVAL;
 	}
-
Unnecessary extra line

 	cmd_from_user =3D (void __user *) args->content_ptr;
=20
 	/* Validate arguments */

