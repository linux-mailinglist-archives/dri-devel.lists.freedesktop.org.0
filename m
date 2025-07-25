Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AFB12028
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5B010E37A;
	Fri, 25 Jul 2025 14:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m220P+xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE910E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcCLx91NW7WTR8r4B3fsthnDlSAmXqWyear8bvZD2suF7dyW8Es1Wwql1uzl6Vi1yx9yqthW/FNyDNwy19c8z1WAXR4Fokau7eFZFBbKXkdan1ILd+eXB1BJb2MOQeLiDoM+0mcA04Kbw/uM4t1mC8P5Gg0TIM64pSEANNETPOFmT94dtxvVag9Z7+Y3jdvMgf39H1ZLeUpG34unIalv1lgpYIo3Gyxo7NuJ6UyYZuCGDPFfpyaDynrwRXUUHzSm5vngD9P/bGQYVgox+hsNZjED9W+ZhWaPbTuSUVQPx/zVEaoleFeJRp9FZYRa5/REypFElpKItpAUsj7LdMiiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNKp3ukPWqG5YJLFjYpgK9aWrcLAQhcrsBZdIw8VA6k=;
 b=Jx7TMcbUYI1Zd1+DTG9qb3K/oNHdMeoKyceIeNShdpa+zkJGwUGhYc/WLRBmptko4woSp8kTEkRqwtx3m795VpDESpnuXbWYaEYNcgCCm+MPR2D/9Qn++kcgha4rMXHyaTGNl8nq5L01f6Pf5T0rVu6T4vKcOA/nsg1jyU8JBw1O/rB6POVWh2tIO8pYQ5xKmb/NeXKAW3C12rzP/cuU49vf1T3Cd/4Doyy9tZS5WCWMnyAPFi61yXWbijQ0gJDCw3Wz4fsQxL74c16RtX8yMtxERXBPZm9JW536RlRT7MW+LEfWktnVSM/0nC21DpRYqA6b4wkXWMZRA5JgdzGIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNKp3ukPWqG5YJLFjYpgK9aWrcLAQhcrsBZdIw8VA6k=;
 b=m220P+xNmMYJYw7mA6wWlTtRuyCUi7ehVujdzFtQ8F2J30aklawrBFgJZYusbOR8+LeT2SXkmjKwLyRaIbXTRU/+UU6LEiWHbdxkVbcV5NzLw6GkFY4IHv5EfWGXZJmOdx7ouPvyS7w4+usXH/N2wQvj6KvqfMBtCdOHnSXl4+Q=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 14:33:17 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::bb5c:1ce:83ad:3169]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::bb5c:1ce:83ad:3169%6]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 14:33:17 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "dcostantino@meta.com"
 <dcostantino@meta.com>, "sruffell@meta.com" <sruffell@meta.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: RE: [PATCH v8 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Thread-Topic: [PATCH v8 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Thread-Index: AQHb9/MPhCylEg39Ok6XffUpJ3kzerRC8f0g
Date: Fri, 25 Jul 2025 14:33:17 +0000
Message-ID: <DM6PR12MB5021A4ECF8810501F96B75479559A@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20250718144823.1157760-1-David.Francis@amd.com>
 <20250718144823.1157760-4-David.Francis@amd.com>
In-Reply-To: <20250718144823.1157760-4-David.Francis@amd.com>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-25T14:32:27.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5021:EE_|DS0PR12MB9037:EE_
x-ms-office365-filtering-correlation-id: 79f71ff7-84ad-4394-7de5-08ddcb8831fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LWqrOua4Tic6HOCo9XBcgaRNlSDcziEFbSXFo+mEs6F3tSZN85jG4EmtXY/R?=
 =?us-ascii?Q?cNZ6AFaIuRNrbyONsYgfW2/NeWS79wvlBiSJSP8yVTtjW9Pnj2SD59ADhWe7?=
 =?us-ascii?Q?ID0kkOtz3lPtpUCJl6SXSRPVSTg71LyZYgZ87NgU4TaD/2vVS58kzASDJZ6P?=
 =?us-ascii?Q?zXRNQeM0IVydeOQEALO1ySAuR1N5AtWz6GeMLM9NPH2ib37vygVnZi7YSMyb?=
 =?us-ascii?Q?NhXvbc5bIL81QaCXSABbgCJrwS0h1NKMphsLwZHkU+0jjeiG2UC+lT71UHhv?=
 =?us-ascii?Q?f+n58T8SP6HCMNj4V+b7im/NYGwROEkDqw3OC8ausCytBeNemAyIR198DSrR?=
 =?us-ascii?Q?awnqGiWNMMjlKtyAouoTE8vM/egYuFUCdGOiLu/OtXgRRCdavCYNWTLOvyV2?=
 =?us-ascii?Q?cSMO8C4AaY5LpyZgrU6K/XeiV5xPr3BBvPbl73WLxhE9BP7kuuQO8TR2xHlU?=
 =?us-ascii?Q?EgPLVQ/MPR4A597Fm6SdepIMIGNhd5nGFrEI38Ybv0DYQTAHR/J5CQ3K9zWC?=
 =?us-ascii?Q?fd9jzKmG4drOTp+HkUbec/AxAUMZG/KvahKD903/OX+TAQlAdennH1o5B6xT?=
 =?us-ascii?Q?sZWCMd/cHgnAAd59Q6oRGjGqqFdjSTT1xaWkwMh4CgHdFfiL0ALlArpeLrYg?=
 =?us-ascii?Q?imt2dhnT4LbdTbisbRwnJESa13jJAJtNv7hbtjfKE3DrJivuySxfhoLuJ/oh?=
 =?us-ascii?Q?isvYVytPeTOV3pGLhoiTVkUsKQ7ToZQRxlnbJCtp4mDpQg/U/MEkqotn3lUS?=
 =?us-ascii?Q?MhBdGVIoCqve81zfzmrC4VLAtCTZ7hATjSwye/av5q97Tjha6EZQX+0JNMCU?=
 =?us-ascii?Q?eZ8j9bv4CIl3Fxtcl8HQnZJ7yYitTKopsVN1T40gl4UiN9eEcGvpYqN5BVFg?=
 =?us-ascii?Q?qpmHOmway4166dzKSFnx6iHaWiofsGGff5iwjEimJHGSi07sHJT6bSL/QOkt?=
 =?us-ascii?Q?jax4ytvPorjjTLx319Z7nNsl3DBxoRpnO0bmkFnTborSPEX26sfnwnlvIvqX?=
 =?us-ascii?Q?stcZxuqLAVwGyqSTKEsH7IVcAIs6WSjym6iX0fzXFTbfsKF+bslUnk+P0/1S?=
 =?us-ascii?Q?7XWP+yJTWbymkrmNOK7bgfgtkWl23LwE5ikqr89fTI2FBzlDbijXvDzhKqpQ?=
 =?us-ascii?Q?WsoLws3G+vwPHmPAA06f34yEjJ+Aajtmyqsvn0mvExU0Mpotz8Hw3B07HV+Y?=
 =?us-ascii?Q?qgITCLmvh6wd2rpgxqg6zykxnAmhzeNXRtS69MAmS4p6hlitwY40rDnRAeos?=
 =?us-ascii?Q?o2mNbeldDKWEy9Q9clDeNg/ruHoN3V3fWA9/PE57geX/nkzSzuM3lOlJgSC0?=
 =?us-ascii?Q?DtAWTmcyWo66hLW+Nb2fDKwhAdzZvhiaRrwJ4c35oYewZFlRuUuQ53fNdngl?=
 =?us-ascii?Q?kW3MYtiw52XWsBvkpRdFCL06T6oDXkfVjwJB0F7bZhU6CERiNgY5AFFVpMSQ?=
 =?us-ascii?Q?jOGHLOJq9QOp4Q0RbtD6TU5WkvL6b97ZvksJpe9k7rJ83DziHUVjV6UVMbKZ?=
 =?us-ascii?Q?Q5xjLg37GgzrZzw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8Z7zp5i7vA2O2eCpu6TntXXB4Kd2Vmo2q3pPt0Lwjhy7PvqwC3olQ+gE20sN?=
 =?us-ascii?Q?YnZV66l1n5ZdzcgtSLj9oUbnqLHGuHt1uCt0a7/qqjp0jeSDVkIJZiV/+sZ4?=
 =?us-ascii?Q?z+jraMd9W8E/m59IYm2uIBgUTtqlB0WplRJ/KayvRuOEdzPpDQ+jIMMZ1iIU?=
 =?us-ascii?Q?+oBNk1t2BH6tEmlEhHLvG+rty7q6vM6FTt2gp+bbRPx9ioy4crI5bBvPB+Bk?=
 =?us-ascii?Q?SyrvymlmMARuk6SghFbXXngfE7mitF5DPuhhDK1TNPjQ8SZAmvnM5VueYZHZ?=
 =?us-ascii?Q?OTylRwRBMt3KUNpdCAnsu2hd/HfhIptLiHOoy5mJjjfzc29AxuYPikSSJZ0Q?=
 =?us-ascii?Q?B4N5tSAUlbss13CNwxZV9Xto4cfMSNTXJBOqt/qsFNDUkLNJTuJuDzOXe84B?=
 =?us-ascii?Q?+JTQtCnUKh42dAqDnVjvaOyCo60skrBZNr6eXBFiSOFzCyB4zfsPHhZKm28T?=
 =?us-ascii?Q?6fzug75uKcyEGP2RpOap7mhkKKf/jJ/WLpYe9ykG7XRw0gcw4mE252TR7yns?=
 =?us-ascii?Q?0erveQ9NLCcnoraMb4I2iqMUio7ZMuo7rCO9HeraCIhqz7iD/1lYcPZ5cBNJ?=
 =?us-ascii?Q?gZLP4izqdUtQ5HzyuLbz0gj7QOgEHS3p/VmUFDEMAZ/z6RvIyFLrG4xhDH4h?=
 =?us-ascii?Q?exNBGGMuNV+aMamg3s99ZZYnBdXTabBcgBMknS4cwSrlGk97YoB98DQr7sOU?=
 =?us-ascii?Q?x67f2t98dlHoZnVVq1N6RF/0Q9fKCXno5tG6wMo7NmT0dX8ipL89NmBUCuUk?=
 =?us-ascii?Q?1oiw8B39M/oU47hofI+Uk5zD/YYe/iPiEuzonxSW2Nmo5Qfk5UNeeDqneB1r?=
 =?us-ascii?Q?wALXHFv5M8+NOC8Wk7UhPC3VZscag1pjlP/xTRBltjjXv0OE+w9Cx3NruPG/?=
 =?us-ascii?Q?J9QAx2nB1f6v+BPbdOnDubEYlXR/aBA0LMzdMYnFVbMUifBLgQCBbdWgh3xu?=
 =?us-ascii?Q?FwP7v7z2vO5BsY3aE3wTY+6bLXwrLXi0J5s5Lihq/vbsg+5g6vtvae3Z2Y9B?=
 =?us-ascii?Q?ecCBqPOoi4p5LNTps0NVlGrZX5y9DU2cOAtOWyFc9JDUO7j4fVsL/xvf4fPD?=
 =?us-ascii?Q?/k6X/7DXA7UQEe0ZstJd4cHbYRZ5CO+N2vsJG96RfmdzojfDxIz6Cj1D/1W/?=
 =?us-ascii?Q?FdkPkjXU2+nscjbZetRtUTK7HERaYvrlWueMn6fL9abGrWRaWAiFtwSSyUj6?=
 =?us-ascii?Q?XH0k98UcvOtgwzwmFy8qjBEgucpprdgXTnjXId7DNFqL9y9cNCkwkm9A5Kdb?=
 =?us-ascii?Q?t6EOsFXuuTJCfgqBUOT5ZuzaeJfQdZcgCY/xRopCdAMSGw1fij7fMvmI+J0m?=
 =?us-ascii?Q?ApG2L+SzpWXo59EjyIJMfhuCtWJzc1pF4QWMPNlzvhSRp8zzFufTTJNZvtVb?=
 =?us-ascii?Q?ml/ZFox+Ci5JnsXxQfpXwi6ApIPvko6Dg3czuyfxnRf1WRc0WNlr5qlO4JKA?=
 =?us-ascii?Q?CtbTftHBb7MliCS+fQmPUZubV/sI/EmuUC/THi9tmI4REPWbvOcxeiT/qi0b?=
 =?us-ascii?Q?CxsSPbmvbq1yMIKevkPHmTOL6h7zvoYwdEdaZECKRSQBwXXtahJdCg1hbH++?=
 =?us-ascii?Q?9oa95p41Cqlhq+Jxyec=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f71ff7-84ad-4394-7de5-08ddcb8831fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:33:17.0898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mq3eYAPBCh+jGr1aUmQKemUTNqKJgH5FbKVDUBb3IKmkaifoqvCP9PSKqG+6tmpu2FG8k4aGFYA5ocGOZxE0hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Acked-by: David Yat Sin <david.yatsin@amd.com>


> -----Original Message-----
> From: Francis, David <David.Francis@amd.com>
> Sent: Friday, July 18, 2025 10:48 AM
> To: dri-devel@lists.freedesktop.org
> Cc: tvrtko.ursulin@igalia.com; Kuehling, Felix <Felix.Kuehling@amd.com>; =
Yat Sin,
> David <David.YatSin@amd.com>; Freehill, Chris <Chris.Freehill@amd.com>;
> Koenig, Christian <Christian.Koenig@amd.com>; dcostantino@meta.com;
> sruffell@meta.com; simona@ffwll.ch; mripard@kernel.org; tzimmermann@suse.=
de;
> Francis, David <David.Francis@amd.com>
> Subject: [PATCH v8 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
>
> The kfd CRIU checkpoint ioctl would return an error if trying to checkpoi=
nt a
> process with no kfd buffer objects.
>
> This is a normal case and should not be an error.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 828a9ceef1e7..f7f34b710d3e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2566,8 +2566,8 @@ static int criu_restore(struct file *filep,
>       pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u
> priv_data_size:%llu)\n",
>                args->num_devices, args->num_bos, args->num_objects, args-
> >priv_data_size);
>
> -     if (!args->bos || !args->devices || !args->priv_data || !args->priv=
_data_size ||
> -         !args->num_devices || !args->num_bos)
> +     if ((args->num_bos > 0 && !args->bos) || !args->devices || !args->p=
riv_data
> ||
> +         !args->priv_data_size || !args->num_devices)
>               return -EINVAL;
>
>       mutex_lock(&p->mutex);
> --
> 2.34.1

