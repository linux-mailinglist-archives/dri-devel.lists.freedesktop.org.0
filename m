Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106D70493F
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40B10E244;
	Tue, 16 May 2023 09:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0F10E06F;
 Tue, 16 May 2023 09:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJW5mmvoUP2rkleikZmMQdQ14Vzha6/fS4exd0Ihax/b6ZVX/FLWU/bHRFjXUN6Bgn4Pst03EoELD22OUXwUsCHENnghL5YZ14mmmEqkrfbettqoFN15Qjqta0GE1haX26CTJOeNwCWVDL7Vr8p5CyyQn2+9Cm57y9yBvR9aZiQX+G0jONR3eb1oLFGQdlHjAeXIN/0pcKDsqHQ0XNsdH9u9IOIMKmh7PXHl73EHbC8DV/YNuCzR8IzT3x7WkwaCm7C3Q1i+8X5TW4NU3u18H0xwqUakuVAxR0Px0WRaBntPNXPWLAw1fpWFTWBlfcqhrCB6mXvGamX8wJRzhjyrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P3smuNfpdFAIZPVhCTyuTil/urr9dMMinptibZCglY=;
 b=McxXx1gLVGBOtC9Yah1cC6LTi4HXlAwb5HthVBfmo6v9hVg6lVvfP31rBsPs737J6GKCVOL4vLsBVniCEpn9Bs/WIc2iO4lJ/Fw/HvbSwpfzZgldzBNCXf8HeXtxDLxuWMy8gFzmX2te2DV8JmzNH/hjUJA6CVfa/Y6Bv/jQicGtEhqEV0Ped/m2gRKZ0C0AyUgLVgjbiCdu3dYtq8rE916WQ3gOxvZdWsfQiM4D2lImhpAaSDTKUQWneNG0+v/Bmlm5qh4hYojRiTX1fuTq1b1L8iYQ9ng3ERW+pO4J1alcWRbnaRKuzsdymynCSF2HOUDepW3sFFN64d4/Uc2oDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P3smuNfpdFAIZPVhCTyuTil/urr9dMMinptibZCglY=;
 b=frvCw8Lxuyqkh0Lj50dYuPxVyCEnD/4GLmRM/QGQSPH0uvD9l+YxcA0ylDdPV7RWveD3zA89XERyaeD7cr5PcaxZTeIYlYlkw5PnusdTM7ZX2cfxsyDNauR8iYNu23pa1ASOILZhug2p06BksDgRAxeRvnBO4F4DMy84sg+MVJw=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 09:29:29 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::57e9:837f:f997:c02f]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::57e9:837f:f997:c02f%6]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 09:29:29 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "lyude@redhat.com" <lyude@redhat.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Topic: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Index: AQHZeNn8+E0QEEuY3UCLaVyy+/niaq9QMZbAgAyOGtA=
Date: Tue, 16 May 2023 09:29:28 +0000
Message-ID: <CO6PR12MB548978062CAB5F80C5CD9F52FC799@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230427072850.100887-1-Wayne.Lin@amd.com>
 <CO6PR12MB5489A03BAAE9F84E39352767FC719@CO6PR12MB5489.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB5489A03BAAE9F84E39352767FC719@CO6PR12MB5489.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-16T09:28:38Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=46603542-923b-41d5-96e7-b32b82ceffa4;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SA1PR12MB5660:EE_
x-ms-office365-filtering-correlation-id: 41f2c34e-79d8-491f-0a83-08db55f00c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wa6zR5LZMp7NL17DSNMXiuP9H3P7u2yU4xR3OWNJPCAI7k7s2nILBIhKaB9F2PcZ25w7A8xITNAiVXWnI7WwnDBy6z2UVdXVVcxFFGF2McvGrS+hcxrzmPoVdV3agZMuntsaNRikfiWpx07P259AGPA/ipSDRF5/1TOCBHRe5ocB6QAEBOtLOGR7BK1XzXSJ8tpGVoIWp1byYPTbfgT1mMBgGaKcJt0a/TL1gMB6V5Hx/XO+PoBfzCfuLgX59o0G+v3sfcGwVRtKjZS+QrSNtxvlRyumX+538Rns9i2RC2jm1NeqYTXV/PPTgl1O9A2atZDYXtzeRn9oJnT4dw19kSRfmgZQK6wzp4ftpEOoMmbpWYMIsfX2oMk2a5TZUFljSKy2hhzytHe+4X3Si4pp2b8s7ZRWXcnBJzaC9fsqyF3a8x2Y+HfUfV5R99gBlI5uLrDru1KtuFFaPE/mgqo3JNXPy+WH6wPSIGe8iAeeER8pxryvnvko57BTlgKEIykQ1HYLM7lIg5J/456bbowROzG+9siDZDCNpQ5cvVQkhdyZxoAKgnd9Plx/uSwGA242uUlLfJ16Mm4zd7upbiMDUI0pApZ3jDqZgeU00suzbylrzQmmyrj+OPCpRNp/9a/S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(76116006)(66946007)(66556008)(66476007)(64756008)(4326008)(66446008)(15650500001)(71200400001)(33656002)(6506007)(26005)(41300700001)(7696005)(38100700002)(122000001)(316002)(38070700005)(52536014)(5660300002)(8676002)(2906002)(83380400001)(8936002)(478600001)(54906003)(86362001)(110136005)(55016003)(53546011)(9686003)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KT9hGdiP/d6ACmMGskUhQ3m0DDuu4bVJ8Xt5qyekTleh5EHb56gGXMq9wn/B?=
 =?us-ascii?Q?xrimppOxzCe0CDNb5Oa4TLaXvWxBXzK4SW6xw9j6/4uYxfGuD64IwSqjAhAG?=
 =?us-ascii?Q?9VoyG1DVozX3nvCAX05AcAshr9BUDM2FYLwXK4zd9t0117D3N37vSem3MGJV?=
 =?us-ascii?Q?kgmU0iBszOz8k+QIeztkL0AKCTvfymavhU9oUMFF31ALPRIQABYgUTZKztow?=
 =?us-ascii?Q?l9+exBR9K9jD8tubRwNA4x21PY4DiN7vDPoaeuYKD7i13pveBfGk5GT4qgrr?=
 =?us-ascii?Q?yeiQMmEKtrytmYTh3lh8SYY5X2E0w3+5ZynmuEpD+XDKnPogVn9Dt0Mqef/S?=
 =?us-ascii?Q?9cRo66AT4nwc6GWdnHBHvYCTwkTOiYQ5PHhLh/46bxbuZRAD5NifxiPoKuWN?=
 =?us-ascii?Q?CibENi2f5AuDi/5Ytcj0/mwqLbxJN2XiMnqP4H8NP8RrGVYCR+XrkIzYOnLy?=
 =?us-ascii?Q?yBo9lt8SdgfWCjRxUFB4P4KmflujU59iA1NWLdP+dggFnopUH9Z/9jwgvK+n?=
 =?us-ascii?Q?WWKEJwrRkbmFj49+hkt7/apu7rL5YaF/bKtvxn000hhshwLSCgVfQIDiakdG?=
 =?us-ascii?Q?r6wu1BBnA2G9WEm3VWESHe1I15pc49tNf6QFAzAflYEzoltcnHYOxlHCVB14?=
 =?us-ascii?Q?i3vLzgZwhp0HyfCqdZtqX9vmhSWQO5ZemJr9AjqciZRO0qwS1C2LrfCU/8x/?=
 =?us-ascii?Q?J6SPJQxVkgQeeeFTV2Q4pDAPqOCJFa+nJuazlWhwoJToaaSWJqKnqJlwrEp+?=
 =?us-ascii?Q?KMeGmeNqhckJbgwkQE4MNkUyvI90g7Q1GH6tJex9IkvXw/d8ITrMPvjNSQ9e?=
 =?us-ascii?Q?MhbjiVKzSRUUEkZg6wSLD4AHr9O/Euqyrxb85QvuKVh0B/Bxod7Yu/fSSTAr?=
 =?us-ascii?Q?eXwgY4v87uzk1tMj1GYRPRp0k3MJZkAflx/Uvt0I8sLhcZyAQq/9KKq3jwlL?=
 =?us-ascii?Q?zJFiJBAAzbV3gcdDR6pBzCzzvNkZ5Mjoe0giRZgNkA6fvRTGM86HYbbFi8Xo?=
 =?us-ascii?Q?tUYnyigPlXPU9NnDDXiVPmr9LOO/1OtS0lRN0x9NjnXb1S8GrIL3DhG90MfX?=
 =?us-ascii?Q?F6o66veMOyxoTVj+AFwPElm6eIeCThwfFfJ97EiPbcGz71ISJFwEWQELwrjZ?=
 =?us-ascii?Q?gtlK3ZaE9fgMHsrCjB4/4i1pXZisLbNjVujA43y/8YmlhRwlwZeyiWL0btUi?=
 =?us-ascii?Q?8ykHBQ9FovUcGzASAc1fGhQBffp41cQ3eNJ9equM+xxtnmuYZHlibzIqhtYO?=
 =?us-ascii?Q?dq48JgW2LY0fhfjs3S9rgUU8w77VN8NgKYO9tl0BUuF/dRnz3Ea+tXB7zGIO?=
 =?us-ascii?Q?w2K1kxY1F3PQRlq6qJ0DzN/pRzoKH182pvGmdq2XCfXKa5ALd05UgtDfdvre?=
 =?us-ascii?Q?Uv4HMCOc2XmkLSykgcvz2xeo/g/Z1U5qGPTeDxogoqPVcz7VEzK2A4KEEJNB?=
 =?us-ascii?Q?6LHLGzv+wpr6BUEKmVz4zxQ9n113ScxnwtocOCj5bIxEUaTiJGpfHqEZsEAD?=
 =?us-ascii?Q?0nhJaaFTvf3QsLksfCadpe3Nz1IxLYIpnmuAgLeqpzOwcxWDFNvxc2anAt3b?=
 =?us-ascii?Q?otX2iEAjHTyoFDywtWQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f2c34e-79d8-491f-0a83-08db55f00c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 09:29:28.8607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YV5xXBl8A+4yLeLsmfGurcUdoS61BtJKliZWbmyL9R2xWJ/QszkjBfUI/FNeMGbOP+50Pto8eFmjAM0CYSyW3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi,

Ping again for code review. Much appreciated!

Regards,
Wayne

> -----Original Message-----
> From: Lin, Wayne
> Sent: Monday, May 8, 2023 5:49 PM
> To: lyude@redhat.com; jani.nikula@intel.com; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; imre.deak@intel.com; Wentland, Harry
> <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> stable@vger.kernel.org
> Subject: RE: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending
> new message
>=20
> [Public]
>=20
> Hi Lyude and Jani,
>=20
> Could you help to review please? Thanks for your time!
>=20
> Regards,
> Wayne Lin
> > -----Original Message-----
> > From: Wayne Lin <Wayne.Lin@amd.com>
> > Sent: Thursday, April 27, 2023 3:29 PM
> > To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: lyude@redhat.com; ville.syrjala@linux.intel.com;
> > jani.nikula@intel.com; imre.deak@intel.com; Wentland, Harry
> > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Lin,
> Wayne
> > <Wayne.Lin@amd.com>; stable@vger.kernel.org
> > Subject: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
> > message
> >
> > [Why]
> > The sequence for collecting down_reply from source perspective should
> > be:
> >
> > Request_n->repeat (get partial reply of Request_n->clear message ready
> > flag to ack DPRX that the message is received) till all partial
> > replies for Request_n are received->new Request_n+1.
> >
> > Now there is chance that drm_dp_mst_hpd_irq() will fire new down
> > request in the tx queue when the down reply is incomplete. Source is
> > restricted to generate interveleaved message transactions so we should
> avoid it.
> >
> > Also, while assembling partial reply packets, reading out DPCD
> > DOWN_REP Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag
> should
> > be wrapped up as a complete operation for reading out a reply packet.
> > Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> > be risky. e.g. If the reply of the new request has overwritten the
> > DPRX DOWN_REP Sideband MSG buffer before source writing one to clear
> > DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
> > for the new request. Should handle the up request in the same way.
> >
> > [How]
> > Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
> > event, driver calls drm_dp_mst_hpd_irq_step2() and might trigger
> > drm_dp_mst_kick_tx() only when there is no on going message transaction=
.
> >
> > Changes since v1:
> > * Reworked on review comments received
> > -> Adjust the fix to let driver explicitly kick off new down request
> > when mst irq event is handled and acked
> > -> Adjust the commit message
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++---
> > drivers/gpu/drm/display/drm_dp_mst_topology.c | 35
> > ++++++++++++++++---
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  5 ++-
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  5 ++-
> >  include/drm/display/drm_dp_mst_helper.h       |  4 +--
> >  5 files changed, 45 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 1ad67c2a697e..48bdcb2ee9b1 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3259,10 +3259,9 @@ static void
> dm_handle_mst_sideband_msg(struct
> > amdgpu_dm_connector *aconnector)
> >  		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1],
> esi[2]);
> >  		/* handle HPD short pulse irq */
> >  		if (aconnector->mst_mgr.mst_state)
> > -			drm_dp_mst_hpd_irq(
> > -				&aconnector->mst_mgr,
> > -				esi,
> > -				&new_irq_handled);
> > +			drm_dp_mst_hpd_irq_step1(&aconnector-
> > >mst_mgr,
> > +						 esi,
> > +						 &new_irq_handled);
> >
> >  		if (new_irq_handled) {
> >  			/* ACK at DPCD to notify down stream */ @@ -3281,6
> > +3280,7 @@ static void dm_handle_mst_sideband_msg(struct
> > amdgpu_dm_connector *aconnector)
> >  					break;
> >  			}
> >
> > +			drm_dp_mst_hpd_irq_step2(&aconnector-
> > >mst_mgr);
> >  			/* check if there is new irq to be handled */
> >  			dret =3D drm_dp_dpcd_read(
> >  				&aconnector->dm_dp_aux.aux,
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 70df29fe92db..2e0a38a6509c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4045,7 +4045,7 @@ static int drm_dp_mst_handle_up_req(struct
> > drm_dp_mst_topology_mgr *mgr)  }
> >
> >  /**
> > - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> > + * drm_dp_mst_hpd_irq_step1() - MST hotplug IRQ notify
> >   * @mgr: manager to notify irq for.
> >   * @esi: 4 bytes from SINK_COUNT_ESI
> >   * @handled: whether the hpd interrupt was consumed or not @@ -4055,7
> > +4055,7 @@ static int drm_dp_mst_handle_up_req(struct
> > drm_dp_mst_topology_mgr *mgr)
> >   * topology manager will process the sideband messages received as a
> result
> >   * of this.
> >   */
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8
> *esi,
> > bool *handled)
> > +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> > u8
> > +*esi, bool *handled)
> >  {
> >  	int ret =3D 0;
> >  	int sc;
> > @@ -4077,11 +4077,38 @@ int drm_dp_mst_hpd_irq(struct
> > drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
> >  		*handled =3D true;
> >  	}
> >
> > -	drm_dp_mst_kick_tx(mgr);
> >  	return ret;
> >  }
> > -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> > +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step1);
> > +
> > +/**
> > + * drm_dp_mst_hpd_irq_step2() - MST hotplug IRQ 2nd part handling
> > + * @mgr: manager to notify irq for.
> > + *
> > + * This should be called from the driver when mst irq event is
> > +handled
> > + * and acked. Note that new down request should only be sent when
> > + * previous message transaction is done. Source is not supposed to
> > +generate
> > + * interleaved message transactions.
> > + */
> > +void drm_dp_mst_hpd_irq_step2(struct drm_dp_mst_topology_mgr
> *mgr)
> > {
> > +	struct drm_dp_sideband_msg_tx *txmsg;
> > +	bool skip =3D false;
> >
> > +	mutex_lock(&mgr->qlock);
> > +	txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> > +					 struct drm_dp_sideband_msg_tx,
> > next);
> > +	/* If last transaction is not completed yet*/
> > +	if (!txmsg ||
> > +	    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> > +	    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> > +		skip =3D true;
> > +	mutex_unlock(&mgr->qlock);
> > +
> > +	if (!skip)
> > +		drm_dp_mst_kick_tx(mgr);
> > +}
> > +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step2);
> >  /**
> >   * drm_dp_mst_detect_port() - get connection status for an MST port
> >   * @connector: DRM connector for this port diff --git
> > a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 75070eb07d4b..9a9a5aec9534 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -3803,7 +3803,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp,
> > u8 *esi, u8 *ack)  {
> >  	bool handled =3D false;
> >
> > -	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> > +	drm_dp_mst_hpd_irq_step1(&intel_dp->mst_mgr, esi, &handled);
> >  	if (handled)
> >  		ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY);
> >
> > @@ -3880,6 +3880,9 @@ intel_dp_check_mst_status(struct intel_dp
> > *intel_dp)
> >
> >  		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
> >  			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> > +
> > +		if (ack[1] & (DP_DOWN_REP_MSG_RDY |
> > DP_UP_REQ_MSG_RDY))
> > +			drm_dp_mst_hpd_irq_step2(&intel_dp->mst_mgr);
> >  	}
> >
> >  	return link_ok;
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index ed9d374147b8..00c36fcc8afd 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1332,12 +1332,15 @@ nv50_mstm_service(struct nouveau_drm *drm,
> >  			break;
> >  		}
> >
> > -		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> > +		drm_dp_mst_hpd_irq_step1(&mstm->mgr, esi, &handled);
> >  		if (!handled)
> >  			break;
> >
> >  		rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1,
> &esi[1],
> >  				       3);
> > +
> > +		drm_dp_mst_hpd_irq_step2(&mstm->mgr);
> > +
> >  		if (rc !=3D 3) {
> >  			ret =3D false;
> >  			break;
> > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > b/include/drm/display/drm_dp_mst_helper.h
> > index 32c764fb9cb5..6c08ba765d5a 100644
> > --- a/include/drm/display/drm_dp_mst_helper.h
> > +++ b/include/drm/display/drm_dp_mst_helper.h
> > @@ -815,8 +815,8 @@ void drm_dp_mst_topology_mgr_destroy(struct
> > drm_dp_mst_topology_mgr *mgr);  bool drm_dp_read_mst_cap(struct
> > drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);  int
> > drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr
> *mgr,
> > bool mst_state);
> >
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8
> *esi,
> > bool *handled);
> > -
> > +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> > u8
> > +*esi, bool *handled); void drm_dp_mst_hpd_irq_step2(struct
> > +drm_dp_mst_topology_mgr *mgr);
> >
> >  int
> >  drm_dp_mst_detect_port(struct drm_connector *connector,
> > --
> > 2.37.3
