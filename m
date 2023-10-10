Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBD7BF122
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 04:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90F610E310;
	Tue, 10 Oct 2023 02:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160210E30F;
 Tue, 10 Oct 2023 02:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcBRB1Q2/1P2lt1OZp6N11/B94In4qnMzfPZm/qGLvurhbdEoyZmP/+9crG6SV6OD5oG7R8ytgsWQIxO0XV42q01zjttfKdscPx3qdijZzV9QQax7Xs+NsXkQlVZWDt29tYiWD6RSIzAzkSiOnVzDAXiQZTRMLOW3HUV3OeE01TkMiyMzsrB7rhwcBSZlWfjtmRRVsvxBZ9zhDu1Xe+qcj+RKzYfNxt0BZGNifyZ/KtFYSktNMrB0AebuWhsEmviw6YuFMC5djhVA+DXaKnhkXGTJyn/P+ATGCbULG4HJeRl+TCFaxL4Jpg2iSCd2kB4UqXub2gdtjaoo6/9OpeMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktr5o0tDTwi1zjt/9nznjycqx8FoktVNf/t2DjYf9gw=;
 b=J0pTWI5zsNdXw4wv6bJAyG5KHD5eR1pkcGncKi1q3S6imOwW95qBy6XTXLhR/G2Iea/P8AhNCsHCeSkVdg1IxHWYVHVAWeUggc5WoEjZPxHvgeLvwZcHhszo3hn/JS7oRYX7NGIPLa8+zF6/ZCNtC7FFCKUzCe4XQBGpj8DZOaneDr+7AdFjRG5amY7MYcjLLBpf/4D7rChdj+ODQ3KT6sp9FqK7EbH9KVDcHMtaLTMyBuZnnJanhzrbXEffVmtTH9PcbwXhTr7VvqvMPNmWRefmPoJDAv6NYVoOf0P/zutx8T0pkxfGNQP14eE1afqHNEp0vEt8deFgi73dT/1tJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktr5o0tDTwi1zjt/9nznjycqx8FoktVNf/t2DjYf9gw=;
 b=ZDFGhhINQBWz8Cwzdl29lJO2iric3IUR80vmT3iYt08QUyQa9yJxfv9eLfkuJccN4RqOQHzgtVM4E/dlQXqK3eQqD7tQNJThidQ3Sr3Bpt4pVYwd8hJ3kMbWLEdPqK18sKEH6hXF2Wect9vLyxif0MFfWQhZhiIxSmL0UvSlUcQ=
Received: from PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 by PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Tue, 10 Oct
 2023 02:58:29 +0000
Received: from PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::734d:d070:e2db:de7a]) by PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::734d:d070:e2db:de7a%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 02:58:29 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: Kunwu.Chan <chentao@kylinos.cn>, "evan.quan@amd.com" <evan.quan@amd.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Kamal, Asad" <Asad.Kamal@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: RE: [PATCH] drm/amd/pm: Fix a memory leak on an error path
Thread-Topic: [PATCH] drm/amd/pm: Fix a memory leak on an error path
Thread-Index: AQHZ+yBUkkY9goKHvke4iWHhXxo5tLBCVARQ
Date: Tue, 10 Oct 2023 02:58:29 +0000
Message-ID: <PH7PR12MB5997C208CDD4587332346CD782CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
References: <20231010021915.36066-1-chentao@kylinos.cn>
In-Reply-To: <20231010021915.36066-1-chentao@kylinos.cn>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5997:EE_|PH7PR12MB5903:EE_
x-ms-office365-filtering-correlation-id: 3cab7e9b-4e92-4d14-f142-08dbc93cc7eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FV6d6VhW71+zWM1veqmeahYzWEchxH8Un9+Y03MwEMmf36f/eJIVr1njPIlFMS6HG8vx1BoMkReVoyxSp+fm/RKLrb0YAn/AARn/GFcmUyjKU7ojcVkhwsA+UIy7CdTGAbzBtW9hy9yjXV8feghbUxi/Rq77i4NzAWrOkaBEhE18pBQKzyf6ckMrE+B17cASh2x3RVQy3C7QkbSufcFvhc/PmIoD+mvib8dEc4aG9I85WWkcSMaZC5/VhsfqI7E+FSQI+xNspmITmTXDcxk5jhVOdBCBy9rTgTKR8kYVDJ4ZllDpsml96KdCy+3IuBDptoenDOAx6tUWPaCnQeVDFq1ILoipYN4gnQ+1L8JtcwHoX9djE6+3igiRXOyVNXm4YFEdLCp27FYPQcmfPl6mFEseNf9RNMWCjQc30N7LR4YevoOP2MLYDaj19cTWSKsqN+JEnhxyYtyqkKQDulG1lIRGdJrp5kBUwHbzJJLM9S7JNLGVaOHKX2MNm+LRfIBre4oc6D26m6nNQ+FxdCHLRBNVTxuCmYpwbu50sFjOXMiELFijy7gAAyNQ79RnKWFEMsDNGeSNhAfDodLqaZVrvByZLyt59X4jpYaLv95kMBkeVFbQHP9C+KAACM5PP4DaiBBrd9Mos1cJnG4EyyaF0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(33656002)(122000001)(921005)(86362001)(55016003)(38100700002)(38070700005)(66946007)(66476007)(66556008)(76116006)(66446008)(64756008)(53546011)(110136005)(54906003)(6506007)(7696005)(9686003)(41300700001)(316002)(26005)(478600001)(71200400001)(45080400002)(52536014)(5660300002)(83380400001)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iRJQzEaeh2ZmkwV8Iv69iKIWSE/JLaKzZpn2ete0bNwKTW+aTZMmEwmWk5Sh?=
 =?us-ascii?Q?jVSnp9tn48MIiDvyvR6zIAHaKk00+SmX2GS1yKzGF7gYhRO9Gz+Mxkom1idB?=
 =?us-ascii?Q?Gyju/2AcmqAASU9SGynv1V8wJsv+WMO00ndfsJG6uoEj89QZHwVp2GlRk1R5?=
 =?us-ascii?Q?kw+UumgNlQvCIt+3lB7PzGs2xMAYZ7anbOVY7DUIR/aS7hFsWk+w9zDxD/lm?=
 =?us-ascii?Q?LCKIMD9GwT3fv3cbvIeBzdPjmqZB1ha1vf0lQo+KsIJStRrerfg921FSOxg6?=
 =?us-ascii?Q?mGLVoYnIaeKk67okTg1gGQvjkAqPYZlVMECP+JjGGjyVGP4nkiQSy4aTeKc4?=
 =?us-ascii?Q?BhB2fAq3TXqA5gqvMa01J95zhguQYokGVjdY4JRITDJnbfzkFgX0HHF2hB3I?=
 =?us-ascii?Q?yPlFPH72x97wWIAJDeYgZwbCHxJWk/igRkLF9r4vahWk/1rESgvhQN2nm152?=
 =?us-ascii?Q?BZOFiT6eyTuLrfqFH7Ncgb/nMz1tzie5vp+iWzptpLcaWFpZTjSdwZtiSLbY?=
 =?us-ascii?Q?Sb0XXnh2x4DXLXXy6gSCLWAxZ/FRuQzg8KkqP+7ClyMWzCEp1E9QYtdvbvjK?=
 =?us-ascii?Q?mbc7D1ub+yUNwWGDguM5hGuFPKXbl+zVa+wuKpSN2onqLwZ61RUpfGZxWYEs?=
 =?us-ascii?Q?ob5MetQ2kEnN/yg/5vAoyvklvZiECWoOMWOcg05LJlVMCc/nv+F11HZL1d+f?=
 =?us-ascii?Q?KFha4HH5zd1uqx9mkD5GEIWTb33XxPeZGp637Yiy6gbhncpDom1LLe08Ga7T?=
 =?us-ascii?Q?CH1vgy4RuBNFH4eC6hZDbdiJHgm5iUtKOeGRfqWeRURy09p5OoxBOSXX+cfF?=
 =?us-ascii?Q?UYi6cfy73qC09wzpVZy5kxRCm++bmKoTkjKVkT9eMpqVSvy7l18Tu8Ilu4aP?=
 =?us-ascii?Q?R566WHdCUcXNR+kqKZGL538LYdQ0s1NzhLArBMkRylu3cLMzjWDwNoB0QLW9?=
 =?us-ascii?Q?CllIpvIFD+mu26zsva+NrbRowaTzFRRkzzCRneocMjRetDjUHmFhlZyr6VBd?=
 =?us-ascii?Q?uUz6hABSN3kqMXGXf3wEeyzLQ3u6Hgh11IIWvBw2LBDQinWEPEYH2unH50YZ?=
 =?us-ascii?Q?nVoMaNc7GKr1WxQ2Qqlef/QHtK7g9hkrjaMKW267DXK1sqlZAC/q1aPpdxIx?=
 =?us-ascii?Q?JjKggNejY15buv4pqWqGyV/JwXwmMs/wAdPTH0EMKKJHyURW9wJxd2Vin/Vw?=
 =?us-ascii?Q?OLuUmvscNo+0IXSW7cF3taRfv0htBBuvFPq0+bVQ/TfMPatZKO1G+IaeIXCp?=
 =?us-ascii?Q?TrN4bj024Ipj0jfbs86HQOxugG14cyBUqzfqFINL4fAjSU3qIdjlO4TNs52R?=
 =?us-ascii?Q?1uHXjQCopt+lRwZbrDh4C62kD8aMi15fAfKMxsUIsEevfqgYK1CuT/KOGGyM?=
 =?us-ascii?Q?RiQ1eDW3XqHyv7CDdSGChv8d1B1L/GGqzSzsH8vXcTQvPWpOnZECashyYTmS?=
 =?us-ascii?Q?qm2322WB1C7VbQyUY1Qf4YjWWzx1HBthN3srj+lDsjLOegtLEMKAxA8wdKrW?=
 =?us-ascii?Q?00zPn4sDfUXnVM0Qj/qYrtr97NPgTobZFv8JJFJ1vbk3WFGg4KS8fEjzDnSk?=
 =?us-ascii?Q?LvBggEWZrEk2Jh6lDqs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cab7e9b-4e92-4d14-f142-08dbc93cc7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 02:58:29.2281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwIQMBfPel7x4qLAJgQIdBl6ItzDKHtFqtgQNb8/EOWYBkSdutxZGWFS4E/O5bDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903
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
Cc: "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes: 511a95552ec8 ("drm/amd/pm: Add SMU 13.0.6 support")

Please add above information into your patch commit message.

Reviewed-by: Yang Wang <kevinyang.wang@amd.com>

Best Regards,
Kevin

-----Original Message-----
From: Kunwu.Chan <chentao@kylinos.cn>=20
Sent: Tuesday, October 10, 2023 10:19 AM
To: evan.quan@amd.com; Deucher, Alexander <Alexander.Deucher@amd.com>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;=
 airlied@gmail.com; daniel@ffwll.ch; Lazar, Lijo <Lijo.Lazar@amd.com>; Kama=
l, Asad <Asad.Kamal@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Wang,=
 Yang(Kevin) <KevinYang.Wang@amd.com>; Ma, Le <Le.Ma@amd.com>; dan.carpente=
r@linaro.org
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; kunwu.chan@hotmail.com; Kunwu.Chan <chentao@kylinos.=
cn>
Subject: [PATCH] drm/amd/pm: Fix a memory leak on an error path

Add missing free on an error path.

Signed-off-by: Kunwu.Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ce971a93d28b..c26e12ff532c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -1981,8 +1981,10 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct sm=
u_context *smu, void **table
=20
 	metrics =3D kzalloc(sizeof(MetricsTable_t), GFP_KERNEL);
 	ret =3D smu_v13_0_6_get_metrics_table(smu, metrics, true);
-	if (ret)
+	if (ret) {
+		kfree(metrics);
 		return ret;
+	}
=20
 	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 3);
=20
--=20
2.25.1

