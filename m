Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2DC17F79
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 03:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD69710E094;
	Wed, 29 Oct 2025 02:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hxUVU/+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A910E094;
 Wed, 29 Oct 2025 02:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7Y1WJaIW/cVckc5g7lbOdC202Nwga7G2HYTqQ6LpJrKHqZWByxWKSyQr6/nB8VlpGMETp2pr0betvynUpD7aevbABTQP5Sfr3OmS5W5eyEWMVgcKcA0yZWqE7cfMr9FwQ+RbO0PA2HMO+3Q2TLwm+Z2bJx3u7k1oTidX1WXiwo56XnakMWwq0dJlNo2Ah2P1IDI9GQYYlMEbpenMNEvGccBuXP+Y7UQ7bBfcIQ5huhGIA7Ma7820bmLrV0jeOxhFhN717rMuDromMunGb5n0hlBOUiGJv7y76NmBi40JN3YB4bpbrNRjcx/KVYhGf0X4W9KiZLDbHy4zkOpsInCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szdfnFSkWFAYeetzRftyOTU4WqTATM9GU5TaJn///G0=;
 b=n5R2iN7YqgQmdM/KGk8zs4n3cqcZGvwrB0uXi28pP6PA0p0Ij+yPsdISzD9y3B/dvlNp7kb5B9PzkcjXuhfj/HzDU/7qx6ivceAjSXy8ezUuK/6qjvx5Nfup1+KOMJcTtlmwCQauUwpw3L1NLVBuMgwmOV0b03W7iviFZL8qV8OcHXj60qdnBTgDl6XNal8ilDtzT1fRfLgdKc3w4ipNztg8ioNvuL7Y6pjGbEL+P9OwhCcXCgnk4nB6vulcMmYq/3GdhsES87pVmfooQzEaZZvVUy4DW9KSRKKCFB2kVTIbPSRWKj8PsyVX806CDlTz1ISC0p7Q242VhdShyYFgxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szdfnFSkWFAYeetzRftyOTU4WqTATM9GU5TaJn///G0=;
 b=hxUVU/+dd0rluERei4lCxKq4Hq2ufy8c9d2YPNJKsZMuzFSgHm7oNeI0k9Ukabxoo9RZ5hKckw3zobXv6uf1r7PMNUt4vp7PKw/UXjV8AJk+ihz5KWbJFsffAz0r3GTLl+pinsJuC5Ad2GrW/XFZaH21pFXA89hUM+H21I7WJRU=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 02:00:38 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c593:f43d:c798:e009]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::c593:f43d:c798:e009%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 02:00:38 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, Dave
 Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, Aravind
 Iddamsetty <aravind.iddamsetty@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: RE: DRM_RAS for CPER Error logging?!
Thread-Topic: DRM_RAS for CPER Error logging?!
Thread-Index: AQHcSD75SgPKZWlzf0KntjDpR9/k1LTYXWzg
Date: Wed, 29 Oct 2025 02:00:38 +0000
Message-ID: <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
In-Reply-To: <aQEVy1qjaDCwL_cc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Tao.Zhou1@amd.com,Xiang.Liu@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-10-29T01:54:27.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|SA0PR12MB7092:EE_
x-ms-office365-filtering-correlation-id: 252b17e0-5afa-4860-ead3-08de168ef501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?POCrIq1rlTxm7Hb6JCYhhgMY1gF43fP4Z0P9XUfPGs/tnTZims+aNGhVkge9?=
 =?us-ascii?Q?uemCOQRNekTYl3SQHg0ashpOkC4gFLzPmUJ0PUA2IWgr9NPsgJhjbQM0y0WC?=
 =?us-ascii?Q?0ZUL5ShpEJpSwZu+Nxe6H4QyyGlnL4e9ijBJpZ0cxstZ1ivgjC2acpa+qnil?=
 =?us-ascii?Q?W0ROCQDxBoOc4q4oc6JFJFFWj0Rp4sRmQ8T2PLliJz7S8tOyqzy7rUYiITpC?=
 =?us-ascii?Q?CJsByvzc0zIJwp3x89kNe6oGyNYHEP8rsYhQNzVMCOAxhobedYEHuT/2Gizi?=
 =?us-ascii?Q?tXEyQW9wQApvBv01Sh/jZjm/IltsyLdPK0VVSfrY1WCZhlJErBPwyxvBVSV+?=
 =?us-ascii?Q?snECxzJ1piDtLQg0K52H2HFdVHR1BurwoH9wWPULEuBB8ahAm2b9vTzMdLQl?=
 =?us-ascii?Q?LWXqbuzP+VaYtpNt1MNpxyA6wwmSio7Gd8d+40nIeKyQ6ATtrMJkhLJL0e2t?=
 =?us-ascii?Q?QlX44RDSGIrbBmhQWT+jB0G9i2YLnDcuI/aDgEHlraEYu5Clyg/i8m4Hu/SX?=
 =?us-ascii?Q?FG3cdsajoCU+PWfo+5bEsv2oew057HfbPMYNT8hMGJ5hAWdMX9DR09DZflJI?=
 =?us-ascii?Q?DRZ/T8PJi+f707vPJaVmN2YemBdEXW+BEvaY4CYGeTPqWYPm3hLUFEWpRo2b?=
 =?us-ascii?Q?VvNyCpcIqcXVpQBRQ3MtdgSeNw5HnBEnhx6aeYzIK9V2FvJcVf1/M9vfkx9k?=
 =?us-ascii?Q?4HIe/vBH2gU44pt4fmf0DoR+pL79oo/SdZTltncvnTykRzW91axlQ1UL7Cgc?=
 =?us-ascii?Q?1z37Fi7WYQ4PzuqHc6zpisyOoarHQd2H4iml+cCa0wkKqd4q4Wb1Et7kLapi?=
 =?us-ascii?Q?pY1mMOJCzHGhlr5GrArv4xhaeEOALcCFdtUgigkx07ENAz3DZbEP8JdLEJdB?=
 =?us-ascii?Q?Er7I/2EwSRuYePNbPwDNpbaxLs9lXlb3chzB2xvl+OhjtvUr1M5FPzpDBm7v?=
 =?us-ascii?Q?znmQ+TNx2WSyhdHpnoGoNBWFe1ZRYy7bwddhiIdwGQgzjZYIODXoNxsmzV5e?=
 =?us-ascii?Q?2/QuUMsWu7DFUzCTPq1BWJAGMDMc8sioA+xjV3yrJETY9XsNbQ3260zcB0/5?=
 =?us-ascii?Q?17LTUj1quMKqMsFI+JF7oDGq0l7HBz93CSagfiuRajylG98/pyTil01+TnKc?=
 =?us-ascii?Q?H4k4I9n24unQJdEmcOysl0tiNNjlJ3A2a0UOq2gNb68g/8T/pzeKi3XuYBFr?=
 =?us-ascii?Q?zPTFUwnKQN6ka/g1JoNxqf8wOAD1q3k/S+UWJXJc1lnxbRoT4L8egR4mD3Yi?=
 =?us-ascii?Q?ZFDdUNAQnPL3SoS08MMsQMkY44HySEm/Ppa5Xt4/J1AwYAU+fE4tahDdgt/7?=
 =?us-ascii?Q?kHjl3VI2u3258uXLSgxdF1iBD4UWguYucNz6Rx2nDR0Y5rSCkpvt6VUiBQkW?=
 =?us-ascii?Q?Arfrn27EkHuHCvyvO/frJrTRQb1Bz4Cl98jzuF5BtqqZq0XVpcjsXPxwLpKe?=
 =?us-ascii?Q?C4tzXAC0gOB2+0S5dWbd84BH2Fgwv7Tn4YSi4FipTKXNdAd+X72W7vvu2i3x?=
 =?us-ascii?Q?W6IPATjocd9DZ4FdYTbyH+HH3GkmPNZbES7y0BJ2ZnqTiLoZ+xCVdaKw+A?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0gvxUt+zH3PcBGLDFD0Qxpu4T2ARAPIwXJ4LRNJ1S7L1GTUGo1UWBC3ZQt/i?=
 =?us-ascii?Q?w3vN0DdfnZalCMg1qsQA+M4tWHc0PvkbDibo1rFBwoUllnF5izIqHETQQvnD?=
 =?us-ascii?Q?YiRERWOGTZomo+90VnN1GJMeBvfo21NPpqr7MqAkICYkTRTiWQNdc4941Bob?=
 =?us-ascii?Q?70NjkS0tu4VHOVYg+KGNt0qh30ljm1th7pLHL8iNB0Ubw5yQzuhTSts86/xH?=
 =?us-ascii?Q?ayPSQiXlZUlzJ8eGTvLQhPDmUXMf8OP6H4vdXtS+vWZ2DpcHj2GuriMOVSDR?=
 =?us-ascii?Q?/B2BPEW4iOKT1E9hG4UnpC75IA2QREPYIYqKyH2yFwJ1ajP3xRA8z46nkl4n?=
 =?us-ascii?Q?T/7DBTXwTvGuv9AYbF5ONz+EkFg8jaQo9wGZUoZSwMaUrkvbfixMIQofJ/iN?=
 =?us-ascii?Q?wgXAeprfSevDkf6UnsedBYKfPojNXg3CvDcsuzzXFaDxDTFRYXLGH6q52/9C?=
 =?us-ascii?Q?w5h4Md55zxWxxUw+w9RiwPxgS81tkw66HNcC13GOGBzzSYTSg9zzbWiYy87I?=
 =?us-ascii?Q?FPmZ3034pAG5ILd/spgRu0soPl2FGHw6mZiqntlKBUWswH34vEHhb2msr0J4?=
 =?us-ascii?Q?rRLleYtL8B9ygGX1b33ukUTJKf0RPwx5DMEMyEkUw+wp2J+doXj9StRYMihf?=
 =?us-ascii?Q?MSbWeai1Ex6XXPEEcH02uygtHB+0X4SDGxVp36MzORrMJ91nCJ/dqfdBUtth?=
 =?us-ascii?Q?lYBtIlTWXP9FAc3OOaABi/2rlw/e8x4WiAUpPuLEsNDyh0N7zi9sn0/dS1CA?=
 =?us-ascii?Q?WmKjj1jS9bynPs2rIk+HMC1w4IkCMaM4VnPy7ixWq5LZmUOXDlkmg6473ZUB?=
 =?us-ascii?Q?H3MInXjeIL0q+L3Hwbq73MP1eyn1OGsS3TTs2+QVRHzTmF8K2dr0/4iOF3Jz?=
 =?us-ascii?Q?Lq6hKhkMfYH0hiC+MgMr9araq8j7icZV9w1oBxhsQjvks0vq4B3Eg9awgbeY?=
 =?us-ascii?Q?H8dchjucbvVbGxiqD2Xj4eV+onopSLvApoZIC8Aav6XdW+wqh7msMcq+pEAX?=
 =?us-ascii?Q?QC0dAyDTsZ/lFgi5ezGtMO/aXMqwlWXZDq/RoicGuA1tC5T1X1Aj5jhAgho2?=
 =?us-ascii?Q?TbyB0vccq4uEzzYV6TPaaBEsogrV9nYdk4HVewXAuonklJ9SvJRON4OK3Mk7?=
 =?us-ascii?Q?zcuKYS2tCjZToBVdRNhsRU9BDbzIY2/nRkpHShUkWOalTvl6F5zGfi14H8Mu?=
 =?us-ascii?Q?EtXUj+BLry4Ce52e1ITLpq2pHIeQf46Gw+O6TEOz5yxrFb5VoxBWyDQTZwqv?=
 =?us-ascii?Q?VTExEBPa6+AN742yNWfgmngvEsyJU8pX5Zfta3TAdkCzDeh1X2dWRzmtxjeY?=
 =?us-ascii?Q?9fF33xjVunBDF0GKpcefuCJmA9SC85tfkSaL+eFDfEkDa0tV9iE5eKqhkPUr?=
 =?us-ascii?Q?DIjdJkDBlEZuxH1UxJ4uo4BRdU2w7ttYe0uaoI7HtxvsVvZQpklJnjKIGnwP?=
 =?us-ascii?Q?vRWHe7TE4ZD7dEl3rIWWJpgQ06hthl9Z1XKo5P4OrJ9e9bZlQQOal5P76jM2?=
 =?us-ascii?Q?CWOqHQ+A55FIQoVh9fuzdROMEw6lDjByU80tvJiR7Uc2e/S+y3M7iThqo/cQ?=
 =?us-ascii?Q?AdNirRDH+t0ho7iWZJU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB52574F4EE2FF679D2230BBEFFCFAABN9PR12MB5257namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252b17e0-5afa-4860-ead3-08de168ef501
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 02:00:38.4467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBNSPxkY4XpSNNNJoPmm8bYi7NlXNiFqPcfw3MFcJywA+bPq63YQwIGOuTApteRmhnpjzQSeC66M3Lpr9jJORA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092
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

--_000_BN9PR12MB52574F4EE2FF679D2230BBEFFCFAABN9PR12MB5257namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]


+ @Zhou1, Tao<mailto:Tao.Zhou1@amd.com> and @Liu, Xiang(Dean)<mailto:Xiang.=
Liu@amd.com> for the awareness.

RE - AMD folks, would you consider this to replace the current debugfs you =
have?

[Hawking]:

Replacing the debugfs is not the primary concern. The main concern is wheth=
er drm_ras can effectively support the necessary RAS information for all de=
vice vendors, as this largely depends on the design of the hardware and fir=
mware.

AMD is currently evaluating the proposed interface for error logging.

Regards,
Hawking

-----Original Message-----
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Sent: Wednesday, October 29, 2025 03:13
To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Dave A=
irlie <airlied@gmail.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com=
>; Simona Vetter <simona.vetter@ffwll.ch>; Zhang, Hawking <Hawking.Zhang@am=
d.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Zack McKevitt <zach=
ary.mckevitt@oss.qualcomm.com>; Lukas Wunner <lukas@wunner.de>; Aravind Idd=
amsetty <aravind.iddamsetty@linux.intel.com>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Deucher, Alexander <Alexander.D=
eucher@amd.com>; Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>; Lukas W=
unner <lukas@wunner.de>; Dave Airlie <airlied@gmail.com>; Simona Vetter <si=
mona.vetter@ffwll.ch>; Aravind Iddamsetty <aravind.iddamsetty@linux.intel.c=
om>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: DRM_RAS for CPER Error logging?!

On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:

Hey Dave, Sima, AMD folks, Qualcomm folks,

I have a key question to you below here.

> This work is a continuation of the great work started by Aravind ([1]
> and [2]) in order to fulfill the RAS requirements and proposal as
> previously discussed and agreed in the Linux Plumbers accelerator's bof o=
f 2022 [3].
>
> [1]:
> https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.idd
> amsetty@linux.intel.com/<mailto:amsetty@linux.intel.com/>
> [2]:
> https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux
> .intel.com/
> [3]:
> https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary
> .html
>
> During the past review round, Lukas pointed out that netlink had
> evolved in parallel during these years and that now, any new usage of
> netlink families would require the usage of the YAML description and scri=
pts.
>
> With this new requirement in place, the family name is hardcoded in
> the yaml file, so we are forced to have a single family name for the
> entire drm, and then we now we are forced to have a registration.
>
> So, while doing the registration, we now created the concept of drm-ras-n=
ode.
> For now the only node type supported is the agreed error-counter. But
> that could be expanded for other cases like telemetry, requested by
> Zack for the qualcomm accel driver.
>
> In this first version, only querying counter is supported. But also
> this is expandable to future introduction of multicast notification and a=
lso clearing the counters.
>
> This design with multiple nodes per device is already flexible enough
> for driver to decide if it wants to handle error per device, or per IP
> block, or per error category. I believe this fully attend to the
> requested AMD feedback in the earlier reviews.
>
> So, my proposal is to start simple with this case as is, and then
> iterate over with the drm-ras in tree so we evolve together according
> to various driver's RAS needs.
>
> I have provided a documentation and the first Xe implementation of the
> counter as reference.
>
> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool
> that entirely exercises this new API, hence I hope this can be the
> reference code for the uAPI usage, while we continue with the plan of
> introducing IGT tests and tools for this and adjusting the internal
> vendor tools to open with open source developments and changing them to s=
upport these flows.
>
> Example on MTL:
>
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --dump list-nodes
> [{'device-name': '00:02.0',
>   'node-id': 0,
>   'node-name': 'non-fatal',
>   'node-type': 'error-counter'},
>  {'device-name': '00:02.0',
>   'node-id': 1,
>   'node-name': 'correctable',
>   'node-type': 'error-counter'}]

As you can see on the drm-ras patch, we now have only a single family calle=
d 'drm-ras', with that we have to register entry points, called 'nodes'
and for now only one type is existing: 'error-counter'

As I believe it was agreed in the Linux Plumbers accelerator's bof of 2022 =
[3].

Zack already indicated that for Qualcomm he doesn't need the error counters=
, but another type, perhaps telemetry.

I need your feedback and input on yet another case here that goes side by s=
ide with error-counters: Error logging.

One of the RAS requirements that we have is to emit CPER logs in certain ca=
ses. AMD is currently using debugfs for printing the CPER entries that accu=
mulates in a ringbuffer. (iiuc).

Some folks are asking us to emit the CPER in the tracefs because debugfs mi=
ght not be available in some enterprise production images.

However, there's a concern on the tracefs usage for the error-logging case.
There is no active query path in the tracefs. If user needs to poll for the=
 latest CPER records it would need to pig-back on some other API that would=
 force the emit-trace(cper).

I believe that the cleanest way is to have another drm-ras node type named =
'error-logging' with a single operation that is query-logs, that would be a=
 dump of the available ring-buffer with latest known cper records. Is this =
acceptable?

AMD folks, would you consider this to replace the current debugfs you have?

Please let me know your thoughts.

We won't have an example for now, but it would be something like:

Thanks,
Rodrigo.

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --dump list-nodes
[{'device-name': '00:02.0',
  'node-id': 0,
  'node-name': 'non-fatal',
  'node-type': 'error-counter'},
 {'device-name': '00:02.0',
  'node-id': 1,
  'node-name': 'correctable',
  'node-type': 'error-counter'}
 'device-name': '00:02.0',
  'node-id': 2,
  'node-name': 'non-fatal',
  'node-type': 'error-logging'},
 {'device-name': '00:02.0',
  'node-id': 3,
  'node-name': 'correctable',
  'node-type': 'error-logging'}]

$ sudo ./tools/net/ynl/pyynl/cli.py \
   --spec Documentation/netlink/specs/drm_ras.yaml \
   --dump get-logs --json '{"node-id":3}'
[{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$}, ]

Of course, details of the error-logging fields along with the CPER binary i=
s yet to be defined.

Oh, and the nodes names and split is device specific. The infra is flexible=
 enough. Driver can do whatever it makes sense for their device.

Any feedback or comment is really appreciated.

Thanks in advance,
Rodrigo.

>
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --dump get-error-counters --json '{"node-id":1}'
> [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},
>  {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},
>  {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},
>  {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},
>  {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},
>  {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]
>
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --do query-error-counter --json '{"node-id": 0, "error-id": 12}'
> {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}
>
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --do query-error-counter --json '{"node-id": 1, "error-id": 16}'
> {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}
>
> Thanks,
> Rodrigo.
>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>
> Cc: Alex Deucher <alexander.deucher@amd.com<mailto:alexander.deucher@amd.=
com>>
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com<mailto:zachary.mckev=
itt@oss.qualcomm.com>>
> Cc: Lukas Wunner <lukas@wunner.de<mailto:lukas@wunner.de>>
> Cc: Dave Airlie <airlied@gmail.com<mailto:airlied@gmail.com>>
> Cc: Simona Vetter <simona.vetter@ffwll.ch<mailto:simona.vetter@ffwll.ch>>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com<mailto:aravind=
.iddamsetty@linux.intel.com>>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com<mailto:joonas.lahtin=
en@linux.intel.com>>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@i=
ntel.com>>
>
> Rodrigo Vivi (2):
>   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
>   drm/xe: Introduce the usage of drm_ras with supported HW errors
>
>  Documentation/gpu/drm-ras.rst              | 109 +++++++
>  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++
>  drivers/gpu/drm/Kconfig                    |   9 +
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_drv.c                  |   6 +
>  drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c               |  54 ++++
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-
>  include/drm/drm_ras.h                      |  76 +++++
>  include/drm/drm_ras_genl_family.h          |  17 +
>  include/drm/drm_ras_nl.h                   |  24 ++
>  include/uapi/drm/drm_ras.h                 |  49 +++
>  14 files changed, 1049 insertions(+), 2 deletions(-)  create mode
> 100644 Documentation/gpu/drm-ras.rst  create mode 100644
> Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c  create mode 100644
> drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c  create mode 100644
> include/drm/drm_ras.h  create mode 100644
> include/drm/drm_ras_genl_family.h  create mode 100644
> include/drm/drm_ras_nl.h  create mode 100644
> include/uapi/drm/drm_ras.h
>
> --
> 2.51.0
>

--_000_BN9PR12MB52574F4EE2FF679D2230BBEFFCFAABN9PR12MB5257namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:10pt;">
<div style=3D"padding-right:5pt;padding-left:5pt;"><font color=3D"blue">[AM=
D Official Use Only - AMD Internal Distribution Only]<br>

</font></div>
<div style=3D"margin-top:5pt;"><font face=3D"Times New Roman" size=3D"3"><s=
pan style=3D"font-size:12pt;"><br>

</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">+ <a=
 href=3D"mailto:Tao.Zhou1@amd.com"><font color=3D"#2B579A"><span style=3D"b=
ackground-color:#E1DFDD;">@Zhou1, Tao</span></font></a> and <a href=3D"mail=
to:Xiang.Liu@amd.com"><font color=3D"#2B579A"><span style=3D"background-col=
or:#E1DFDD;">@Liu,
Xiang(Dean)</span></font></a> for the awareness.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">RE -=
 AMD folks, would you consider this to replace the current debugfs you have=
?</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">[Haw=
king]:</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Repl=
acing the debugfs is not the primary concern. The main concern is whether d=
rm_ras can effectively support the necessary RAS information for all device=
 vendors, as this largely depends on the
design of the hardware and firmware.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">AMD =
is currently evaluating the proposed interface for error logging.</span></f=
ont></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rega=
rds,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hawk=
ing</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">----=
-Original Message-----<br>

From: Rodrigo Vivi &lt;rodrigo.vivi@intel.com&gt; <br>

Sent: Wednesday, October 29, 2025 03:13<br>

To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Dave A=
irlie &lt;airlied@gmail.com&gt;; Joonas Lahtinen &lt;joonas.lahtinen@linux.=
intel.com&gt;; Simona Vetter &lt;simona.vetter@ffwll.ch&gt;; Zhang, Hawking=
 &lt;Hawking.Zhang@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@am=
d.com&gt;;
Zack McKevitt &lt;zachary.mckevitt@oss.qualcomm.com&gt;; Lukas Wunner &lt;l=
ukas@wunner.de&gt;; Aravind Iddamsetty &lt;aravind.iddamsetty@linux.intel.c=
om&gt;<br>

Cc: Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Deucher, Alexander &lt;Al=
exander.Deucher@amd.com&gt;; Zack McKevitt &lt;zachary.mckevitt@oss.qualcom=
m.com&gt;; Lukas Wunner &lt;lukas@wunner.de&gt;; Dave Airlie &lt;airlied@gm=
ail.com&gt;; Simona Vetter &lt;simona.vetter@ffwll.ch&gt;; Aravind Iddamset=
ty
&lt;aravind.iddamsetty@linux.intel.com&gt;; Joonas Lahtinen &lt;joonas.laht=
inen@linux.intel.com&gt;<br>

Subject: DRM_RAS for CPER Error logging?!</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">On M=
on, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:</span></font></di=
v>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hey =
Dave, Sima, AMD folks, Qualcomm folks,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">I ha=
ve a key question to you below here.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 This work is a continuation of the great work started by Aravind ([1] </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 and [2]) in order to fulfill the RAS requirements and proposal as </span><=
/font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 previously discussed and agreed in the Linux Plumbers accelerator's bof of=
 2022 [3].</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 [1]: </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 <a href=3D"https://lore.kernel.org/dri-devel/20250730064956.1385855-1-arav=
ind.idd">https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind=
.idd</a></span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 <a href=3D"mailto:amsetty@linux.intel.com/">amsetty@linux.intel.com/</a></=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 [2]: </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 <a href=3D"https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc=
2@linux">https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@l=
inux</a></span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 .intel.com/</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 [3]: </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 <a href=3D"https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-=
summary">https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-sum=
mary</a></span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 .html</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 During the past review round, Lukas pointed out that netlink had </span></=
font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 evolved in parallel during these years and that now, any new usage of </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 netlink families would require the usage of the YAML description and scrip=
ts.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 With this new requirement in place, the family name is hardcoded in </span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 the yaml file, so we are forced to have a single family name for the </spa=
n></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 entire drm, and then we now we are forced to have a registration.</span></=
font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 So, while doing the registration, we now created the concept of drm-ras-no=
de.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 For now the only node type supported is the agreed error-counter. But </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 that could be expanded for other cases like telemetry, requested by </span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Zack for the qualcomm accel driver.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 In this first version, only querying counter is supported. But also </span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 this is expandable to future introduction of multicast notification and al=
so clearing the counters.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 This design with multiple nodes per device is already flexible enough </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 for driver to decide if it wants to handle error per device, or per IP </s=
pan></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 block, or per error category. I believe this fully attend to the </span></=
font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 requested AMD feedback in the earlier reviews.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 So, my proposal is to start simple with this case as is, and then </span><=
/font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 iterate over with the drm-ras in tree so we evolve together according </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 to various driver's RAS needs.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 I have provided a documentation and the first Xe implementation of the </s=
pan></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 counter as reference.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Also, it is worth to mention that we have a in-tree pyynl/cli.py tool </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 that entirely exercises this new API, hence I hope this can be the </span>=
</font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 reference code for the uAPI usage, while we continue with the plan of </sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 introducing IGT tests and tools for this and adjusting the internal </span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 vendor tools to open with open source developments and changing them to su=
pport these flows.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Example on MTL:</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 $ sudo ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --dump list-nodes</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 [{'device-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-id': 0,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-name': 'non-fatal',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-type': 'error-counter'},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'device-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-id': 1,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-name': 'correctable',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; 'node-type': 'error-counter'}]</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">As y=
ou can see on the drm-ras patch, we now have only a single family called 'd=
rm-ras', with that we have to register entry points, called 'nodes'</span><=
/font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">and =
for now only one type is existing: 'error-counter'</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">As I=
 believe it was agreed in the Linux Plumbers accelerator's bof of 2022 [3].=
</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Zack=
 already indicated that for Qualcomm he doesn't need the error counters, bu=
t another type, perhaps telemetry.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">I ne=
ed your feedback and input on yet another case here that goes side by side =
with error-counters: Error logging.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">One =
of the RAS requirements that we have is to emit CPER logs in certain cases.=
 AMD is currently using debugfs for printing the CPER entries that accumula=
tes in a ringbuffer. (iiuc).</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Some=
 folks are asking us to emit the CPER in the tracefs because debugfs might =
not be available in some enterprise production images.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Howe=
ver, there's a concern on the tracefs usage for the error-logging case.</sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Ther=
e is no active query path in the tracefs. If user needs to poll for the lat=
est CPER records it would need to pig-back on some other API that would for=
ce the emit-trace(cper).</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">I be=
lieve that the cleanest way is to have another drm-ras node type named 'err=
or-logging' with a single operation that is query-logs, that would be a dum=
p of the available ring-buffer with latest
known cper records. Is this acceptable?</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">AMD =
folks, would you consider this to replace the current debugfs you have?</sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Plea=
se let me know your thoughts.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">We w=
on't have an example for now, but it would be something like:</span></font>=
</div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Than=
ks,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rodr=
igo.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">$ su=
do ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; --dump list-nodes</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">[{'d=
evice-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-id': 0,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-name': 'non-fatal',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-type': 'error-counter'},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> {'d=
evice-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-id': 1,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-name': 'correctable',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-type': 'error-counter'}</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> 'de=
vice-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-id': 2,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-name': 'non-fatal',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-type': 'error-logging'},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> {'d=
evice-name': '00:02.0',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-id': 3,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-name': 'correctable',</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; 'node-type': 'error-logging'}]</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">$ su=
do ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font></d=
iv>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp; --dump get-logs --json '{&quot;node-id&quot;:3}'</span></font></di=
v>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">[{'F=
RU': 'String with device info', 'CPER': !@#$#!@#$},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">{'FR=
U': 'String with device info', 'CPER': !@#$#!@#$},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">{'FR=
U': 'String with device info', 'CPER': !@#$#!@#$},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">{'FR=
U': 'String with device info', 'CPER': !@#$#!@#$},</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">{'FR=
U': 'String with device info', 'CPER': !@#$#!@#$}, ]</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Of c=
ourse, details of the error-logging fields along with the CPER binary is ye=
t to be defined.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Oh, =
and the nodes names and split is device specific. The infra is flexible eno=
ugh. Driver can do whatever it makes sense for their device.</span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Any =
feedback or comment is really appreciated.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Than=
ks in advance,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rodr=
igo.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 $ sudo ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --dump get-error-counters --json '{&quot;node-id&quot;:1}'</sp=
an></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},</s=
pan></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},</span>=
</font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},</=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},</span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]</span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 $ sudo ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --do query-error-counter --json '{&quot;node-id&quot;: 0, &quo=
t;error-id&quot;: 12}'</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}</span></=
font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 $ sudo ./tools/net/ynl/pyynl/cli.py \</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --spec Documentation/netlink/specs/drm_ras.yaml \</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; --do query-error-counter --json '{&quot;node-id&quot;: 1, &quo=
t;error-id&quot;: 16}'</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}</span></font=
></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Thanks,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Rodrigo.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Hawking Zhang &lt;<a href=3D"mailto:Hawking.Zhang@amd.com">Hawking.Zha=
ng@amd.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexande=
r.deucher@amd.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Zack McKevitt &lt;<a href=3D"mailto:zachary.mckevitt@oss.qualcomm.com"=
>zachary.mckevitt@oss.qualcomm.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Lukas Wunner &lt;<a href=3D"mailto:lukas@wunner.de">lukas@wunner.de</a=
>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com">airlied@gmail.com=
</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Simona Vetter &lt;<a href=3D"mailto:simona.vetter@ffwll.ch">simona.vet=
ter@ffwll.ch</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Aravind Iddamsetty &lt;<a href=3D"mailto:aravind.iddamsetty@linux.inte=
l.com">aravind.iddamsetty@linux.intel.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Cc: Joonas Lahtinen &lt;<a href=3D"mailto:joonas.lahtinen@linux.intel.com"=
>joonas.lahtinen@linux.intel.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Signed-off-by: Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com">=
rodrigo.vivi@intel.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Rodrigo Vivi (2):</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; drm/ras: Introduce the DRM RAS infrastructure over generic net=
link</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp;&nbsp; drm/xe: Introduce the usage of drm_ras with supported HW error=
s</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; Documentation/gpu/drm-ras.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 109 +++++++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; Documentation/netlink/specs/drm_ras.yaml&nbsp;&nbsp; | 130 ++++++++<=
/span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp; 9 +</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 1 +</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/drm_drv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6=
 +</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/drm_ras.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 357 +++++++++=
++++++++++++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/drm_ras_genl_family.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 42 +++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/drm_ras_nl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 54 ++++</span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |&nbsp; 22 ++</span></fon=
t></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; drivers/gpu/drm/xe/xe_hw_error.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 155 ++++++++-</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; include/drm/drm_ras.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp; 76 +++++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; include/drm/drm_ras_genl_family.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 17 +</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; include/drm/drm_ras_nl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 24=
 ++</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; include/uapi/drm/drm_ras.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 49 +++</span=
></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; 14 files changed, 1049 insertions(+), 2 deletions(-)&nbsp; create mo=
de </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 100644 Documentation/gpu/drm-ras.rst&nbsp; create mode 100644 </span></fon=
t></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 Documentation/netlink/specs/drm_ras.yaml</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; create mode 100644 drivers/gpu/drm/drm_ras.c&nbsp; create mode 10064=
4 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 drivers/gpu/drm/drm_ras_genl_family.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
&nbsp; create mode 100644 drivers/gpu/drm/drm_ras_nl.c&nbsp; create mode 10=
0644 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 include/drm/drm_ras.h&nbsp; create mode 100644 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 include/drm/drm_ras_genl_family.h&nbsp; create mode 100644 </span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 include/drm/drm_ras_nl.h&nbsp; create mode 100644 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 include/uapi/drm/drm_ras.h</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 --</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 2.51.0</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&gt;=
 </span></font></div>
</span></font>
</body>
</html>

--_000_BN9PR12MB52574F4EE2FF679D2230BBEFFCFAABN9PR12MB5257namp_--
