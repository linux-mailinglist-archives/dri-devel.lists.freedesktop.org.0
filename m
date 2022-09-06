Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E45AF5AB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A662610EA82;
	Tue,  6 Sep 2022 20:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D5510EA90
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 20:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElTPzkY9QoNdtXnU/ThnyrvOMWRS8SZjb/dkrVlqFkr69aU/hv6E38QcMKha7/PjRm6FE/Ml4tQMH5P8AiJqBF47/sc+sPHAXu7B1q1kr3sRQxdI2ESuYWzPKXMzn0Fx9uO0qYWRp2EbpL0KZhnoDl3HvaR1k9fh6Z9dNeHLTjEsbkzzHSLaOsJbJHiQg5EwDJ1fD8rEyuNvy+pUmcvhHWCW3nAd8UIt8sfuFAjUuTUjudWtMGD0s/ryNcMmeFpvKPE3ntRvKl6kocjgLJmrjxfG9/FPC/cBNxvAJ1l8A9byNYN9FagH1K+etgRiFutHsEy/ppYEgbU2IBYpGWzDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34naMvWaNV+X9axlIrNnqgzPB38iyvJM04vYCT9ECIc=;
 b=hTcpgBkpmgXSqb/hxvVAoIT7yLmmhzvuqirYvxifBXrli5synFa4yMwuf1T/q2vYdFtVyvAzTcgRdQ1N8JkeaKwoO4naS/uZBsidgqcq9UBs34DleTutMzOwg6esdiJvvRM+Ot6J7AVHFB+0219/nNGyJce9jXhe3LdJpthaOwjA8h6PidFcuI6gFESrp3RVPUjQlj3fcAWFhTAMfBxmTpQ60bHjQqbBl9TtBz7AZHYL1saaKXJ6CtTSOOor0ohOz4AIdnLC1q2E/rgOpXaUX5IVwaVlUMpAANDyt1SQbA2bO+JGTyrXKQP1rbCV8CaumBvu1y/RUoTFXt/i0i3unw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34naMvWaNV+X9axlIrNnqgzPB38iyvJM04vYCT9ECIc=;
 b=SJL9Xjzf2G2tuwJn4bhqX8+M8wf1auFKL0CsViiPQjnv+WB0W7S06tzd1vckElMMZKKdQzPQUrERPe3jVq317ZL3XcK+23kAdI/4op3yCWbtH9u6WfYbndukhVPgnt6LeWpiDR/gnfZxfx9oYgTWxPBYWAWrNUcWDVuFPoPOfRM=
Received: from BL0PR12MB2532.namprd12.prod.outlook.com (2603:10b6:207:4a::20)
 by MW3PR12MB4538.namprd12.prod.outlook.com (2603:10b6:303:55::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 20:18:30 +0000
Received: from BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::9805:860e:5969:1ca5]) by BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::9805:860e:5969:1ca5%7]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 20:18:30 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 2/2] drm: get lock before accessing vblank refcount
Thread-Topic: [PATCH 2/2] drm: get lock before accessing vblank refcount
Thread-Index: AQHYnhVm6Ek/j+Aqf0WCc5ru2Aw07a3TDzCAgAAJ1tA=
Date: Tue, 6 Sep 2022 20:18:30 +0000
Message-ID: <BL0PR12MB2532B9036E590FDAB14755DAED7E9@BL0PR12MB2532.namprd12.prod.outlook.com>
References: <20220722215234.129793-1-Yunxiang.Li@amd.com>
 <20220722215234.129793-2-Yunxiang.Li@amd.com>
 <YxedadEMAfWHON8P@phenom.ffwll.local>
In-Reply-To: <YxedadEMAfWHON8P@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d8752381-b589-44be-a832-d71ff8e99222;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-09-06T19:57:26Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b2c1f05-ed8d-40ef-a995-08da9044f727
x-ms-traffictypediagnostic: MW3PR12MB4538:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sr0hpJowmU25vCo9mbJVjLGu2J3PHkFjHHLsiWMkvG8YOlt31MczasTi+4v9+Wg6K/JPYwyAYV4JXNerCWgr1eiEcCN85bPHyj+lj8/n79gZJgiwK0t0R5Qft78+t//EuSNFrsYwwz05m0gmq+5pDYtyysHvHe0FOnZbOEYxlv867o1c/VOLJ2h8X/CFzlgHXphSyL626bRJj21J6K+SO0Ag2fPAhZc/2XLuqlBJLUCEwYmTYrzrx2VfUCoXb6HNXcAV82iKgV02iu4cXu2HtftC/TkUd/AGNGfkepwWw1HaO+NEDyb1QVMGLrEm4fCNJPpYQjHs4qSrDIBUnVBURLvxGIsWWZof08io82iCHc2DOcoHF5zOQQaMOBFMTL3QSlmgHjfrnGcqzWnDPIuP6LSTRWI6aGkxW6gEzKE3x8ywIizF71Run0MaOyoS7M9RPXgcFWY0AIDR5Bs8+01M1gdJsBzsSSVJKWgtL54Ll7cURg9F0L4F791zYw0Nd24MIZfPNjET0xj3N1I+Pu5ObHuz7Lm8O+P3oVLE3d0iH2L3sDaMsiQ6zIIyWCAY4QK8LhPlcyLEQGDEIBPDwWXOJvTb0b892HM7GbedpsuKQZDIgTp+2lyUhPmMc5EiWUU74VkwNV2xIDD3LdBVTU1MylMgzpw7fUNE03Okp9nnFJpICdlkhNYkHFgnSx2G0IoNW4oOmqbgp9+f47gRFV6FkiF8vyUhKad7xTRBtFpzDtryMmBIwy7cfQCwcYEyC9zAB3eKvwJrecCbxIlV5XeHPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(55016003)(6506007)(7696005)(86362001)(83380400001)(66946007)(66476007)(8676002)(66446008)(64756008)(66556008)(76116006)(4326008)(33656002)(4744005)(478600001)(41300700001)(8936002)(38070700005)(52536014)(9686003)(5660300002)(26005)(2906002)(316002)(71200400001)(38100700002)(122000001)(6916009)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9GPBlFP1QCbjCIZuTJ4LicZC0yJ5y5BGgy83ZmwtzO68yZ994S0X+X+/abUq?=
 =?us-ascii?Q?gC0hUyyYfquSLH8aGmXVhOglQjUrFdOh1BQZfk/IVqPz5X/fDKDQL8u35LF6?=
 =?us-ascii?Q?I3zlwgs+88BhPAD4zJXkcFT5TCkHxObNiC0Fq98Aqwu8eH8PEyjdWrDfwUV1?=
 =?us-ascii?Q?uUuEeVvOIPdCxJIDFluPgOjkXmZFqi7XEhravtQi36xA4Od9Qwe3GEyMTS42?=
 =?us-ascii?Q?YMsTwFaUgjg15yyDN4UXLmak7+TaIRrg72Yn39zHgdiHHTFZZW6lG8V5RkfI?=
 =?us-ascii?Q?uT5/NO0n55v+v+vkC2oGxVdRVPCctwhCsgxFvG2TPK0AcVN/PLwbHODbe0wG?=
 =?us-ascii?Q?Uc5bZ2qu5DyPkuWBTlwznj/2tsZ2bTFMEkKmRKaQOaCFSrAxqfWJq7OpZL49?=
 =?us-ascii?Q?s64oGgijmcEcDx/c5U8c4C1o4DQG+CM5Hfua03dCX2vmEJl2A3YKfy00G4oW?=
 =?us-ascii?Q?oK/k1xc5E+LO6rF9gF2g98bXGooya0+EVzLdic5LjCuekCFpRAALjz3t8jBb?=
 =?us-ascii?Q?b1WkNrWYrAV4+SP03lgiSTFzhHa2UFemQtXz4mgIhmsPt9Q0CqMaPdTLQ63u?=
 =?us-ascii?Q?evJHtde5dz7ZPN9FRWcEkG57VXnQSgjf/UTLeQGX53YwBxQM1eFGSxKMpOGt?=
 =?us-ascii?Q?yEzJAGfLePxrHACq9xeR4rNNC2RNbHDzS9qEzbxBRjLIj2NwHY8hKM1o2Kq8?=
 =?us-ascii?Q?gKcN2hRUGJa3j8IB2T3DOjs/LHcb6p9BOmWPdsmmcynnuDN0ZtXatDulGTGL?=
 =?us-ascii?Q?1zu/MPaZtlk7F5ui7ClalQMSPTIRsm4Ul1yLUdPt+BBPDwFQDFUCBG+LzK3G?=
 =?us-ascii?Q?9ieHXalYgmAy1K1rxKn6rVowgkO7yAM38fjx8nb/ngxNyl/xs2SS2mkeyOy7?=
 =?us-ascii?Q?1D1F98RHJk+NzKIb5zxnLuVHFRcnQRZ74EmSnsYXxpEk+PZy+r3Pa9ibz7sn?=
 =?us-ascii?Q?Ky7FiwFk/7KKDLIvALdKahdSgWDET7LCxGyiPsPtt6pdfgrKNE6/DA6JwApi?=
 =?us-ascii?Q?URuTy2neB3IOE/5IcaU+I7sBYD2r6V7gsMH5guQpC1FgWvGTTq050OjrFpz+?=
 =?us-ascii?Q?sY7CJc8XpMvlRQKipNAXPG7xY6Xs0GVnCt+e/VCIsPsXvI7fRph6OIAja8iY?=
 =?us-ascii?Q?1dgqRRLjiCq/N7weV1zgEri3uetO06Vf10i0/2d1LbLJG0JaHgotbNszmxLE?=
 =?us-ascii?Q?1MX1lvv3IlBPkYft9qIrxJh2eEvq8tCIY1pZ9WvT1LDmaw5+1VOf3xb5WzJ+?=
 =?us-ascii?Q?BimVx8eHAq9iLya8oCxxbiIvgJcAax8K60s7BlD/WId1Tl+TCXAcGVByfwG/?=
 =?us-ascii?Q?6oDO3SVGIxSJskJaxcvNjEbwIzE+SVpXP6Pawz0TrGtDlvgcc1yJ8zDOepPZ?=
 =?us-ascii?Q?LC3GOGd9kYwZZVEGDKRpeD/b5+OY0HdRL66i3LkSQ0JwJMYu2bpBWtIPnBsA?=
 =?us-ascii?Q?5qvKANF/yOeGFIwLXKTY7Y03zct9gm/UgG/FW0jl7aPHnnvITBX1sZTVil7Q?=
 =?us-ascii?Q?mUrZvt6ULgXq+usoqknOfskYKjhiyKFK+anAESv2trnLlBMnhXGdrOaA9T0S?=
 =?us-ascii?Q?D8qypZfPDiTLmmEICHk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2c1f05-ed8d-40ef-a995-08da9044f727
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 20:18:30.4937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL9HsZkm7us4mTNclWgJ0GHA585hbNArnmBnpktvlrR58VT8yG85SU9Sr/hJCeL0eLyJPt5R/a6iM9e35f+wtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4538
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Daniel,

I added the check because I saw that the refcount was always updated/read w=
ith lock held elsewhere, and the pattern looked very similar to in the put =
e.g. drm_crtc_vblank_reset. This patchset is outdated by now and I've sent =
a fix to amd-gfx for the specific issue in amdgpu.

However, I think the way drm_crtc_vblank_on/off functions increments the re=
fcount without enabling the vblank is still a bit risky given how many unch=
ecked calls to drm_vblank_get there is elsewhere. Maybe it's more appropria=
te to simply add an WARN to drm_vblank_get when it's called with inmodeset =
set? This way the WARN happens right at the problematic point, instead of f=
ar into the future when the put is called.

Yunxiang
