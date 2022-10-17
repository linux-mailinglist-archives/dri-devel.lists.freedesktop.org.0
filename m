Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A304600597
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 05:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA2110EC0B;
	Mon, 17 Oct 2022 03:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605E210EC0B;
 Mon, 17 Oct 2022 03:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iffuXSy9iQvcAmIW13/yeYHAuQZ47vJHFMPEmlhDLG7UGHtaI7WJEc5dFSqB34kymah730yL5pLmKAM2zy09EgViP4ZjZR6jeK1Rhy6qhOOArxmRquNPlHVY6Agadq/6Jl47iBJcJSzyt0YFJJYLXXMJ4XDo6Pe5vtjiiwd+hH3LtCwbX6+B6WyWjFX/H5WJlkvwR/wy24SO5wRp6OaqtZpMh8FCDVkYxvZD2gGOLUX42k2ZV8/stqZOa+tzC7bf+k4yblDFgO5TU814M2Y+B1jW99bZgOT0e96HXfqJhN3HkRheenv2i3M5RdEaPeNAnqVObXdZPT9xpakuKTfIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTU/xlU+gVACHlCN19BubUli6tlY7nISsjbmw+EpT7U=;
 b=GYj29ZECRs3QoRZK2kwWTlNN+UD8Xn8YJX7xyIDZu7xoaB/MNMuh8YbUOvaoqMq1l/Khcl2H8K3k4CNjZYGX5NGn6j/sdK/KqLmbCHM/fZsDrNktOVkbIWqW+J7hsTEO+upbOTrhZO/+cq5P7WSJi8cFhV0IvwPE7DuASaDfvwWtKtZ4y67eQ8LZa5mK3dFmt7OKFqHt+Z+WFsTCAOJQ3i8v3cbKZiz87xXofCU4WgsoTeClwwFljjq69ipBtVNOx4WSywlFTDl7RVe4ufI1tWpncLlvRm1Y1crY7K8SEdiNZnsq99hISAlAwlN5R09lTx8oS1Rg2Lk0CxSAsHfJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTU/xlU+gVACHlCN19BubUli6tlY7nISsjbmw+EpT7U=;
 b=ryH9H31fS3hkTmLGqe2DbLlb7WLR1GWI2Rf3V65+SIChOCG8V4vpwTLRksuIWd+D88qMhOuWxlnklaJyfqVIr5fsF2hAbnsJaRLpIj0373FhSBbpP0XzhVzBSxst8npJzTEpL79BI6zKEP+DgG8o7dmNnUNziekRfHLNXszJlVM=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 03:09:06 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::3d67:3b2f:923d:4013]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::3d67:3b2f:923d:4013%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 03:09:06 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
 drm_dp_add_payload_part2()
Thread-Topic: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
 drm_dp_add_payload_part2()
Thread-Index: AQHY2C9VBLfMXNdR0USEYN+jTbr6+q3+tHQAgAF+94CAEcKWwA==
Date: Mon, 17 Oct 2022 03:09:05 +0000
Message-ID: <CO6PR12MB548939841653ABD0EAA95DCAFC299@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20221004202429.124422-1-lyude@redhat.com>
 <d3b272e1-3b5d-c843-e8ac-57dc5e3a7ced@amd.com>
 <128762cfb6524d17e6ee7308aa7e859dd350fa63.camel@redhat.com>
In-Reply-To: <128762cfb6524d17e6ee7308aa7e859dd350fa63.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-10-17T03:09:03Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4d641ff1-f8a9-47e1-a107-bdb527d20dd0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|DM4PR12MB5986:EE_
x-ms-office365-filtering-correlation-id: 234f1225-6ee3-4615-e3c2-08daafecf38f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PIB3YX9WhVAW6+0EAreREb28huJwVgm8TbcTIEC1flFkUdE8fAtJ9bcqauIJbGz6ej8V0mPX5Xmz1tYUGdWD1T+NEL6dYr1i3Ghiib1dGpL31vhQkHMJxHI4iqgqsg0j5YoxaCRDr5mA98JfUVcuHLFBgyXcv03tAiwnjDRcJGay0RyILDwRSAZ1V3qZs06RF9AcaTthLHIf9TJBxfrTcA2dn+tktmkhTMr241FV0BnsaSHAWm4xrmReTrLs2xyOXDOow0ikPcBzyi2sQ/k8Svsrz2XbiQKUC2RmgcpIl03UE94m9FnnAzjkHZOvsK60Bhv5my/3WNibNH8kwVztrdUYvSCOF0kdSg7meTlBbDAs2MaSqrv4kum7EjvX4TldGCp11TOdbMqoOFulPxk285PLYY3+bIM8jLGdQhB1+Sj14lOniOJecMfMtQ18IjpIqSaE9fZGpLjs0CNb+xFov11wJghKIP1nf18An0rZh6WOwF1vIKDh0jEVip1eYBBBag0vktQFq6dzBQN+FILAsk9SX6FgmhnNgCCNkFvIIlgr1QGUbDueTKQpxX3Vy/lxRWRYGWb7VNoUq5yvC6UNE+IURDyGWScpmETa24oagVpLPxPpdcRzfa14U5Zg1WICXpDVkWd+7Kz6xSiDPkXkUEINMkkwBjz0/S8rSucYvGTBzZBiDT8fEkh+jcUVOcYIzzMR/DX8vKoil4Lh6pae6a1UckfuzYJIP4/u6e8kJlhf2MILoTnjfXtScOee8iJXU6aiqWc+unOp8zJj2jJjwt3/8+uiABIcJTcvTgfMMhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199015)(316002)(45080400002)(54906003)(110136005)(966005)(4326008)(8676002)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(7696005)(71200400001)(478600001)(5660300002)(52536014)(186003)(41300700001)(6506007)(9686003)(2906002)(53546011)(26005)(8936002)(83380400001)(122000001)(86362001)(38070700005)(38100700002)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RUvOcgqKSgHRtK0VwZW4wt1/OqqJ+hpNrxbK8ckG2jD79RZK2XYRDYCgtmeP?=
 =?us-ascii?Q?T81k4ydsmsKYMjITxgsVBNusrkYE8earP6tKHiqQUWNZwVtnhInN9Z8XGqg5?=
 =?us-ascii?Q?6SQk6GvpwDIVLu4GV09oh/Puha3IKPP4xH94NLJwnJAsAWZZ4x9HTEMMTCbQ?=
 =?us-ascii?Q?igozcfwdMiF/b59kBTdyIyxepxZtMDkELLX7EBmD5M2KaHw75dFGGIHQLnK4?=
 =?us-ascii?Q?v0byjV++KZ23nbI6HcxxztFsj+ATQtuShMzVzIBjKNRz88a3LOsSBsxiDzQc?=
 =?us-ascii?Q?SWlgvUMmrLgYtcdXsjNUZE7dj/4vQ0DORd/Js7mDCfNfs00+VP5wyARXo1fA?=
 =?us-ascii?Q?/FWTwWthzBPjrvbzpj3Q6UXlhqKJZa+VSG3QtnATJhr9QAbxP2q3jx0RTLIq?=
 =?us-ascii?Q?5DN+vW5z8TgaJ7RzBGSsSJEkpWH+qbu9lPGGIDJvIuPcouf69pubyoU/dLHi?=
 =?us-ascii?Q?ufPRcVPxLeJu9ZNlBLCHEzSTwvXIQ1uivKTaBTxbMzrLyzvPsUbv6U01+bRq?=
 =?us-ascii?Q?NSYpkLY7E9BV7jlwGBL83s5HY5SOGxBOv2BQ/uqWxskktFXZn29khSxrbyge?=
 =?us-ascii?Q?B1hMB3YVipmUl/1Y4N+5OUeIfaBsZnN+hVitwEu3VN00s5lS/2W4CYl1Gu5y?=
 =?us-ascii?Q?GJFmHx8MkbrhD9nTsyzhqqvbmibOHNNxAB3rqVRwXwpu7w9ah+ijT4/xWIL5?=
 =?us-ascii?Q?8jjVw3usgjxQ5/pMV6+ar515mxmareUfa5BCPp1ebeb0x6v9xr/ZFy1LlvOf?=
 =?us-ascii?Q?aYSnOxa6uvHzsJcFm77IC7NuzogNsnydm9RecE31ybyRyqig/XXpLU5NOMwY?=
 =?us-ascii?Q?QryEmFJfkyXXBwL3X7bw5v+H+wLBKJzM6jnjyxxMSh0CMi4qTzwGWvZjk44t?=
 =?us-ascii?Q?mTV18FLfii7rZBLzRAmeatWVOPCmTZygQQLVJisoJKwwDKLryuMD0+D/8YDe?=
 =?us-ascii?Q?f68zDgBHJjA7o1cDzlw2WNdA8OpJPwGvOeatt27jPTY9+whD4OOByjXvAs2z?=
 =?us-ascii?Q?AlWooCArhtheTpl5KRfSZMXlUQqc0YgBUnOYdstFltn7CVX6+htWbIfNRfpY?=
 =?us-ascii?Q?580ueZYHTyJFAe84t+/lUyTk6KYQAtqszHYBQsqL4Uqv9p8zqefjQJvV8pK1?=
 =?us-ascii?Q?1qXeGCmvpCvFisv+gjdILU4pMrNiSsrGHwVs+PRoBTD7WlsPbC9aRV19J1pg?=
 =?us-ascii?Q?Do94EzvFFTrzh1vAibx6V26LfMILL1ELV0CQHodYHI00SgsjzOrAUhmNcL9D?=
 =?us-ascii?Q?9ZMhqAAl6egvr11+X3bI5kzESuBYY86C2NnQcJam3tRclys9sL/crNldX1ey?=
 =?us-ascii?Q?k+/evw4XW9GRAktVRurCba8TuHf+OmZjI0mRt7trIKHZHcKlK7ftBX4dNnx7?=
 =?us-ascii?Q?i6rV3CgC/70vgMOuoMWczhgdW9cbgJRdj5Efwaq/yS4oQsa+07NicKWkw2LW?=
 =?us-ascii?Q?9NaYtIhQ8QTs1oBKmh0VdZqzhbupIJuS5bg3GATWG+doclw8kG4P8btEBbwl?=
 =?us-ascii?Q?BUqO9QViGFsyoV6vIQ8FaY4nqM6kcx6Oxl2ERtwQdytc/OK2ERbbtM3dwgK2?=
 =?us-ascii?Q?Ma9H6PjhA3jVQwyvn30=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234f1225-6ee3-4615-e3c2-08daafecf38f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 03:09:05.9470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHarT7jUHxBQ7SAZjTeywNg2yvCJWv5V/tJXL+XwPr1eT6QsTf1f1D0Py9FM//qfMQdryhUI/FQh/kufmrjSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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
Cc: "Chen, Ian" <Ian.Chen@amd.com>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 Claudio Suarez <cssk@net-c.es>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, October 6, 2022 3:37 AM
> To: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Chen, Ian
> <Ian.Chen@amd.com>; Mikita Lipski <mikita.lipski@amd.com>; Mahfooz,
> Hamza <Hamza.Mahfooz@amd.com>; Claudio Suarez <cssk@net-c.es>; Colin
> Ian King <colin.i.king@gmail.com>; Jani Nikula <jani.nikula@intel.com>; o=
pen
> list <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
> drm_dp_add_payload_part2()
>=20
> On Tue, 2022-10-04 at 16:46 -0400, Rodrigo Siqueira Jordao wrote:
> >
> > On 2022-10-04 16:24, Lyude Paul wrote:
> > > Yikes, it appears somehow I totally made a mistake here. We're
> > > currently checking to see if drm_dp_add_payload_part2() returns a
> > > non-zero value to indicate success. That's totally wrong though, as
> > > this function only returns a zero value on success - not the other wa=
y
> around.
> > >
> > > So, fix that.
> > >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Issue:
> > >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> > > tlab.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F2171&amp;data=3D05%7C0
> > >
> 1%7Cwayne.lin%40amd.com%7Ccd5a63120e064f4bb6aa08daa7090baf%7C3d
> d8961
> > >
> fe4884e608e11a82d994e183d%7C0%7C0%7C638005954559719396%7CUnkno
> wn%7CT
> > >
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXV
> > >
> CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DnMIGnUKS6EDrdKJ0rR%2BAh
> FRa4ST0%2
> > > BYr9bILmXv40yv0%3D&amp;reserved=3D0
> > > Fixes: 4d07b0bc4034 ("drm/display/dp_mst: Move all payload info into
> > > the atomic state")
> > > ---
> > >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2
> +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > index b8077fcd4651..00598def5b39 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > +++
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > @@ -297,7 +297,7 @@ bool
> dm_helpers_dp_mst_send_payload_allocation(
> > >   		clr_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
> > >   	}
> > >
> > > -	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state-
> >base.state, payload)) {
> > > +	if (enable && drm_dp_add_payload_part2(mst_mgr,
> > > +mst_state->base.state, payload) =3D=3D 0) {

Hi Lyude,

This line changes the original logic a bit. The 'if' case was trying to cat=
ch failure=20
while sending ALLOCATE_PAYLOAD. If the msg fails, set the set_flag to false=
.
If succeed, set the set_flag to true and clear the clr_flag.=20

Sorry if the code wording misleading. Thanks!

> > >   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> > >   			set_flag, false);
> > >   	} else {
> >
> > Hi Lyude,
> >
> > Maybe I'm missing something, but I can't find the
> > drm_dp_add_payload_part2() function on amd-staging-drm-next. Which
> > repo are you using?
>=20
> If it's not on amd-staging-drm-next then it likely hasn't gotten backport=
ed to
> amd's branch yet and is in drm-misc-next
>=20
> >
> > Thanks
> > Siqueira
> >
>=20
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
--
Regards,
Wayne Lin
