Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BAC8C5AF9
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 20:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE8210E18A;
	Tue, 14 May 2024 18:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q+S7AcML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6610E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld6KQr4a7gFriskpo3F4tCyzQ/YZPa/s9/QtOQrgpgzIArb5q7Z72pzN0eFcz1/SkIjUApthqjgHi32YOhQs+A13f4C9khKuxPcHb36w6l8IKbHDn88H9URBy081t09zUSei4s2vaxuGCIV8yXoK0BLhlFcdi3NYAUX2NLKDFYBaOgp9fV/b1/cELyJsKqp1JQgb1ysW6qViEb2NfmW4pDWsqr1SpVVBCkLP0zmiy5VHgrYGRRCJkgjZPzM/k9vstb/k7PNB4d2DRfumVmzzBjNJ+2U2G8zj3LXzPBbNcOYqQn44OsuzoZNUr/v0ZuI/8RT1OxZP7WmS6+Ba0Xk4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RF4Xm+1/Owbtjvy9scmjxTo2mhupENUylLlCCzglvA=;
 b=Xn0O4EFUSX8eGSqRjxOCHBaKq/Kjel7J5iaVQgfQHBOgDKsU3ZA4B42aqVP2K4+P3CFghdeszatKerRCzbhX2f1J+GVh02fVXHLJE7D9MLR9gvXUxG1rK63Js9Ejv47DgQEvE66VAZ4rG/uU7dRXJJENGyRNEfbqXhcP0eKkm7iL0vsFDRMnSA16OUab8b1zMNHPzqNJQbZIayBHLSMA1EOytaxD6zlAwZkdV9TYw4uMH/XFVcm1rlmaxLhkmz+9XNOJd/SfavaV6lGC2aBG4WYdFQm04yVn1bbMKhIAkE6F80jLzAv6JnPPrbxv1Sh186td4Kf4cSzib6Bnc16vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RF4Xm+1/Owbtjvy9scmjxTo2mhupENUylLlCCzglvA=;
 b=q+S7AcML4Dmfd7HGgUtCQjIeShFqynk37lZdHEYgL4Tq93WEYhlTZ6P7HRLrNRhjYo8IiUqtNpcKz+tivKltLg/jM7N8s/FczPMwNK+YRKhuwT5ZEeF9dV+/+j27MRtq1ctZk9SqyCX0IIhTIqsP/1gAFDpKA4iTrttFWv7ZqUo=
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 18:20:17 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::2e76:1977:c456:6faf]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::2e76:1977:c456:6faf%6]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 18:20:17 +0000
From: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
 <alexdeucher@gmail.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Dave Airlie
 <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Chan, Benjamin (Koon Pan)"
 <Benjamin.Chan@amd.com>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHapc5aW+MlwW2dl0GecX4g1oYmjLGXCj7w
Date: Tue, 14 May 2024 18:20:17 +0000
Message-ID: <CY5PR12MB642964F3A1D72F422DCB814BFEE32@CY5PR12MB6429.namprd12.prod.outlook.com>
References: <20240514171417.492a1301@canb.auug.org.au>
In-Reply-To: <20240514171417.492a1301@canb.auug.org.au>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=be8fbee1-feed-4f69-a6f3-e3a47f11ab2f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-05-14T18:17:06Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6429:EE_|CY8PR12MB9033:EE_
x-ms-office365-filtering-correlation-id: e52406ba-78d8-45bf-0400-08dc74428198
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?KA8ptH3/0jxhkHcddMxCTbfVbY07adheMKWXECo+XPmbxIFDNq3FzumhJkOJ?=
 =?us-ascii?Q?ZJ11kDecZOd4cz4dfnoPZQSR+mXBdXIt9l0eOs+XGf2cWeDJvhr7U8X64uGP?=
 =?us-ascii?Q?92S3zh89Oyluf0zPhOgsYx2ADT8W/oyj74ay4rAJ/RfpO7FnpHbtkbHr+gLT?=
 =?us-ascii?Q?3AmKYmfTKDsRTrFt6HWCSmL7Exun/YcnnYlhfEt+qH4oU6J0lX/vtKGWXwY1?=
 =?us-ascii?Q?2n1E9e9olOUfebpvlQj0lL9m+4TN8Qr6ziPqgV9/iOkSEcFwN0gz9ghI6owz?=
 =?us-ascii?Q?LH0vz1D6xJ5MmOxDbIhtvZRqXKlPCmzG0j1PobG1Bvp/canABWxzyXEPCpH/?=
 =?us-ascii?Q?gpGNb1OBAEu1qKJWp042aL4FyZlSUggAqrM1LtmzPjpsTPuNq0r0yu+JnTUQ?=
 =?us-ascii?Q?/UinOBnyT+JtowG7FbseRhfXRxskQFX/K7OEZCuVcAMNaFNTQASJeb3ByFtY?=
 =?us-ascii?Q?Kk+0OWd1MtxcpnLYEs066JU1rGogQaOfXe4zw4lSWMU/clHQl/RlJRc+TJPc?=
 =?us-ascii?Q?qFdkKC+9QOzP5oMCAPJvFuyfAIz3wwb93J4e+ta+q7f5eCvn6Q4GXwRf0pEX?=
 =?us-ascii?Q?2f/DUHWsA+fXjmwh/87LvDm99HK1XV5VQyMLMAf7GjhV9iCAJIuSBw7vwmVn?=
 =?us-ascii?Q?u79qwk9eraxHpxTexIXIXI1lVkfJNtqJUlnEzbsKvEs0y5wrnwbIcAY+FJ93?=
 =?us-ascii?Q?wozm9PGOXWMARcYEbREsn3BGKIyY0hJw1ZMJyh96AxUNhG3KMJRRSlw/v7fN?=
 =?us-ascii?Q?REjb1HHUICTRknRN/hYWupTjYSBL3IIlpS+CVzBBaChG2i1NtJ38jHMIe2QY?=
 =?us-ascii?Q?1WHPnEzqROqYIhb+bE8GtfRNTALzIH94hrshfPx2Ihb6RhLNxAjpmIQpBnbD?=
 =?us-ascii?Q?ZbtOcjPphcVcLO8SCNxljdT5ymlGu+JbKyf/AoUoIQIqVPULlXq/MNCzolvr?=
 =?us-ascii?Q?Nk9lKbcZOZp3e1K6JAXo5zNsjk/xj5muxKQ2C7mOdNnMyJmRjhd85VjacnqF?=
 =?us-ascii?Q?TnzRAcmbzS5XzECiDCEd617yJSie6b0GCnPBq4cptYCacdzfFUAljyYzHBhD?=
 =?us-ascii?Q?SDu9j9mHe3lLUZwnGeJXpks9VcWfARUqStm6ALkMQsqIXxMAXOqocKfBE9ss?=
 =?us-ascii?Q?552ZqqaqVuxP9Icx/FUljgWrG5cY76QwYRdl5gh8NbSOgiJDugRc11WKK9lC?=
 =?us-ascii?Q?FUWQOJ7fzTFo+w/eq8Me/3jlXdWhe9elEH78qgFVuYTTORzmw+RxmSfW7cXq?=
 =?us-ascii?Q?khbPafgUqbXR8cip2sEfCvl/AA9Fb940VOYBY7Uw+DKiZ30XcXNOZve2m54t?=
 =?us-ascii?Q?anzg9gtAyHeTH436yjs/3g+eOoV+J0YeVPATZEy4pvjsWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6429.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JOcs2Z4IQPxJeidU9Mm2UtiNOD8p9nN/PnkSHpB1GPIPH4es7Xouu0yHYWa6?=
 =?us-ascii?Q?HD7n4f+heVBAjTH3aBlDKCcez6pQ3iv26bIHMC0gnmBCzzSmuzoc74bbgCFt?=
 =?us-ascii?Q?Eja2EpC5RIoHmPz/s+DMglnuNpn943T6vRCWscBoW8/ONPLYvu1WI0jLpxd9?=
 =?us-ascii?Q?9nk3cphx5N7dOJHLazd2jo8ig2sUQZVyrNsiq895VeLzS4jwNvVLAZGNsSvS?=
 =?us-ascii?Q?qkahEZwWSayFyVetDnmcxrA2ZUw96o/yN1yJL5EhkYYKjFOXoMhYqVzi49CL?=
 =?us-ascii?Q?SX8Xmqig5fF6R25PBV52wXZL2ieaPBFFFYpoEDZ7ptci1CpcaQqrWExoj1ng?=
 =?us-ascii?Q?w+81xojPaSggBkSE61kRdeYWQ2mv7+HgBAKYibI+bv66/vMDQiQYutB7D3Uk?=
 =?us-ascii?Q?15F2HxbDKO1w55O8wkD/N8XSz5+p4Gsa+JICoosZQGg3/oxuSUkd+tdLQdk9?=
 =?us-ascii?Q?kNuyYuiKEExLjoJwWk2EQeQ0eZGrHh3u+JkNEbaLL6kQk7RcFHrh4DbV4YZV?=
 =?us-ascii?Q?TzI+Ux8lqANyj4CIvcXjUO0f+ibWZSbikshnwTeOMOjZtRzL1ROL+AZc0TGR?=
 =?us-ascii?Q?bZaoYQLfj/045gHLMYwiSlxKQNOPZIY2x6jwxUMlOy0j/RtSA4qYZRESo0Vm?=
 =?us-ascii?Q?c1sV8rRB9JYAH/e4A8StE3MRW0cnkYp8ksTxijuA3AdM8EPauN6UAp/iRgRX?=
 =?us-ascii?Q?x4igrrS/tYQezsDvq06ggi68B8t9lcUDBgcnJ2L1opJOykhd9PzumYnF25Q7?=
 =?us-ascii?Q?AOr20KM7FIg00tGakboBizH7RpJgVH7JHGA8HC4YRhNGYqpJM7B1hkLOwVB9?=
 =?us-ascii?Q?Ik0Bv+rDuaJPjR8CN2zv7pLC8n2bnL+iDINremP5PE/pJyU2TDYIJFMfTkN3?=
 =?us-ascii?Q?gDt5TIfyR15v9kY70bZlX/zZdsAap4KIH13eEJyosBGCnh2WAe5shS2U65nO?=
 =?us-ascii?Q?BjHjLWB7RHxr24v/3eud0oA1LbiiKBcwG7Yd+SaRJ/NeYfZGMP9ttB2s/pT9?=
 =?us-ascii?Q?H3JM3DOp7KdUthWGSHj6T9JdPsouOLXxbGVk6TPQcwvRLJD1aSEp1Zy/D+pr?=
 =?us-ascii?Q?SfM8afsdTGrIx3/79xbGxw5vaE6UXxjkKsC7LErcmCTpe7vE4f9RxIigJykP?=
 =?us-ascii?Q?ZjQsLu0tOB0lhFyX3XlvnCxDyHA4TFQDz79FbYjs/yMTHcw1jdNJxjs2o4CL?=
 =?us-ascii?Q?NIVuMy8FFv5qbAbINzVXaBOzQnPgnl+dYaGfzoZpwzoReJYVyjOdo59qxALJ?=
 =?us-ascii?Q?623ccohw9Q3T4YXNHf00HGVmX0tddXv6D0VVDYvm4GF13ob4PDG8KXvKoy2v?=
 =?us-ascii?Q?r3U9ydfbOsQ3Wj9CFk6qk11VPNba94yT4WvsMRPI+zVgKV+uIbedkA/cHl6y?=
 =?us-ascii?Q?GGjXddMGZyfXTp5FOk0g2kNFhS/oUZvDFGVWovYaQHJW7PhUs/MovwKtWUTf?=
 =?us-ascii?Q?243xUpclbtHDVTJCmLjCexUIn/eULJnmJjufNk3FJmVtDETtF4ZiJlnqDSru?=
 =?us-ascii?Q?4GHMDSavIWjftGWr1t6z+o2nYOEiskITknqcPepf2vfTtDsAEWOmGPgxquO2?=
 =?us-ascii?Q?0ZQdWmvqW8Y4BcIjgOk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52406ba-78d8-45bf-0400-08dc74428198
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 18:20:17.0586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lf+pGs5b8t7PgzaHSa1njEZCRZrYnmzYUUJmZYzY3pMm+gDe3pUUx2+4xY0m5ILoO5ErlvmsRiOLQN/sMtft2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033
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

Hi Stephen,

Thank you for reporting this warning, I will address this in the next amdgp=
u patchset I will be submitting in this week.

Thanks,
Pratap

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Tuesday, May 14, 2024 3:14 AM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Nirujogi, Pratap <Prata=
p.Nirujogi@amd.com>; Dave Airlie <airlied@redhat.com>; DRI <dri-devel@lists=
.freedesktop.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>=
; Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 this warning:

drivers/gpu/drm/amd/include/amd_shared.h:110: warning: Enum value 'AMD_IP_B=
LOCK_TYPE_ISP' not described in enum 'amd_ip_block_type'

Introduced by commit

  a83048bfa402 ("drm/amd/amdgpu: Add ISP support to amdgpu_discovery")

--
Cheers,
Stephen Rothwell
