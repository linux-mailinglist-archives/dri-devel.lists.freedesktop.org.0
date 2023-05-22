Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFB70B607
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9910E24A;
	Mon, 22 May 2023 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD610E24A;
 Mon, 22 May 2023 07:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0n9ZqNTW/HtRy5qMVQirhO9+Pxa2YpHe/vLOS+bh3szyf3XhK/V5+fP1I8tPTEWwLylg/giTqywxzprr/ENWfbtZrSDPwAu3+tGlKYS/Kwnr3ANJr0HJLs0xQcnNxdj5js/7sq42kPSSmndD2n844qzPUwFXOqdGJbG8bGo+d5PNVtUB+VS2diYSf6K1+n84JFey5XP1mM5DRCA+Bii+/wchME7Yd5g7Xw0nDvXVYq8skH8efDLf8PFBX0wMyxy4EAwxB8MqFQrQFHjBjbvqUsv42paaftMpv32MWbnCTWodGKqd3QWY3YupsobvuttP111Yk3cSir7t3X27wh68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuRcMbXGLvSWQShZdM+YsFT7Hpo6RfZ/Q31WQSiCvAc=;
 b=Y0qlvriHMqNOosrjMRdn0RMYBO1VqIcCkpeWtR6fAD45WIenZcoielzx5gaX2F4SCJLI0Oi8nnJfWutcumwSXMMTyJYZGaqpHjFOcU++75g46qN0w5ttKy3E4GZcX40rB6ifFVodmfRpyKFxWn4pItJZbro/Vn0KPNQcNCiweuJJR9fPS8Ji83IIoQLxHs3LsOZNv7qrPXpb1pCGTTYjB+ygkGaCN7Q7VhO6gJKajZejnjV53cBP/ZtyeZzjoCfsU852c563pAFGYMlgbE3XunZOXSs2wYrlq5WZ/Dic+mn5+F9WXmMt5fCUxtLmxKj2q0njI1kBM2LjwLPlVpxKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuRcMbXGLvSWQShZdM+YsFT7Hpo6RfZ/Q31WQSiCvAc=;
 b=IvguX4FmgpH+s7U7ncMA9xDMtUakfPGlhBIolGgf2eLxpZZRYcDe+kp8ZMG0cNyO3e9TFs6hN3vVbi9tYfwlYeobMW8T90EPhGCJQvVF8YiFksVRK469AkNi8fJxsZBkNVfCZe2RFU0XVZOUbSzZC6gx4itWTySbAtWD6goUR9c=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.25; Mon, 22 May
 2023 07:11:45 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::4758:8922:780a:4d4b]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::4758:8922:780a:4d4b%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 07:11:45 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Topic: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Index: AQHZeNn8+E0QEEuY3UCLaVyy+/niaq9c0kAAgAkv4uA=
Date: Mon, 22 May 2023 07:11:44 +0000
Message-ID: <CO6PR12MB54898B16634A0F4E9BECE643FC439@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230427072850.100887-1-Wayne.Lin@amd.com>
 <87zg64h8ep.fsf@intel.com>
In-Reply-To: <87zg64h8ep.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1d086bf5-ed63-4455-9ab9-a78d6b29b1d8;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-22T06:52:31Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SN7PR12MB7788:EE_
x-ms-office365-filtering-correlation-id: 616f13e6-f236-43e6-89af-08db5a93ccda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zKVrkCZoqZaNF+zfN5elstPbmUevAa8AW6sFvBqy1OPcexyDaRtdARMmcP3nFrdAPTp/jMmKU8SEJkOznRU8LJa5qm4eqmOM2u3ANJaQoBFrc0ouSrkRo5W4YKn9sOFs+ldyS2QJsIj6gbOTZa9PRtJoKsGT8Pkj6y0GjFsegnNBndQqCL7gk191bg1RFGFVk37z6QL0OBniiG4+gdAZo2cmjvwRb18HVz6TA4W51Rs+6ALZOlEk8NhE0YtoFpIWt1ROKqvxYq69GPPbK2V4hEIGhibXJAOTdFQZ4GbD8xfZ4+Db5clP7rq5ztnCc31uGo5ROtrmK84TbHJEIvBFNCOnp4ymld/wfCR6kio+bkFbbNTvGIQ5cNLpkv2ypEDbU5ajW0F7fxXAecqc+Ya9SWqNXDJjOjqwr82PS3MNQoM/jFqWwxna3rPU4VuIiOG9nY6HlPzIA85CxbsZKRD9Tfbei23PhN8H2S/vlap1TJJO4Bzf3WmyESEpIbSJ7qPwARXVO827hZcxz5JVOGKRd/jpR7leaATSkogQj66g756fR/3YCYOwOyi077JKtMEzyZgiRfm2sXluM5h4utpJv2QihtazJmW2izeXtYwkEColuut03AKk37MG3YfB9tYr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(38070700005)(86362001)(33656002)(55016003)(2906002)(30864003)(186003)(55236004)(53546011)(15650500001)(83380400001)(76116006)(71200400001)(316002)(66946007)(66446008)(66556008)(64756008)(66476007)(110136005)(4326008)(54906003)(5660300002)(7696005)(478600001)(52536014)(6506007)(41300700001)(26005)(8676002)(8936002)(9686003)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m6D+N4QiHh97X7r6eIkfPssMoNPPwySUylwk2XvsUDd0kTrBSQyNFh2K99UJ?=
 =?us-ascii?Q?iBfKlpKTawzYpdS/Rut6RU1J3jFIoiurDjJfZjGsIMOBwckGmGdt47nvkJcU?=
 =?us-ascii?Q?s1bVFWZRhVfphC4lzyrcsM+QZ8wtvLIRP0nCzFuszbIJbjwkK/i1lMKhysJF?=
 =?us-ascii?Q?ahgr+yMMdRERZWqenNjjiL1/zg6waQvEGnL/inxiHu59+hnoaiENbJ3stGD3?=
 =?us-ascii?Q?f6NTXjDixQhrCu5N8ksk+IYVWGL4E6bn8BAfRFRZt1f53q9RHcPrqiVsr4kQ?=
 =?us-ascii?Q?wkoumtsv5Z3/0L21RPcZJdm5hdx80TKOF9NtswCTVVhRjjYplZzk/3SdHu/j?=
 =?us-ascii?Q?ggy7RY1lqMP6Ck4BFdZ1WHhNBCIQLZ+no0GyxIpDZvrsdFLoEJvVrWJbaZeo?=
 =?us-ascii?Q?3JPDEsQl6trjSiJUc7JPlJfWaH9s79NzFQ1sppK/GifyMkvovOp+dgUYMuOB?=
 =?us-ascii?Q?RU/Kouap9dAtneiOTY/h8spxyM+//CjqI1lG91s1/aF8V/s4LAtSl7bOWXNU?=
 =?us-ascii?Q?hYThmwxSLO+Jgxi9mKHSOIHLziH6Lvf+/LCd/xEcRepRkavfy7mD8zBBK120?=
 =?us-ascii?Q?EeHtuIT5io6TMaEh0HbDujFShHlKt1YrEhARTpa/GDc9Q83iflyA7zWFLQbE?=
 =?us-ascii?Q?RGiw6kqSDtW2Ql/S8Ko1uMib8Gbmk3DpzT6/I1UNe+6cCxWrFApXf4MByDHE?=
 =?us-ascii?Q?la05GMcb3wM8Wyhz1Vx+J3snlm+nKGXPh94UKDzbezpYQdRi5L4oumDkuEQH?=
 =?us-ascii?Q?K5xSOjF2A0HuLCI3Iwmw8Sc8B9PF27RjMalErMVXNlx9m1mv00Sv3GyKX5GA?=
 =?us-ascii?Q?tkzy6QPuA5Dhq/Skm7y5Lj2gXC+Hy/y0NfchQ4jlMy9PoFvnMIP91dQ46KUd?=
 =?us-ascii?Q?FrNPuNsL4XpnR5WtQEHZvgq4KFymmPX8WjRdWWFiIaP3wPM11E8nWiUjB/3/?=
 =?us-ascii?Q?1ZShSg234PKRoBZou7waac5tr6RELv/jMA3jqHIUZNbYXS/rL2s9N1RelAdX?=
 =?us-ascii?Q?MfPuukwOz9iNltVc8b07NJIlIW+yKCe0IThebCfynToOxhrKeLjQKfyUIQDn?=
 =?us-ascii?Q?p4urvlpgyHqMKojkdGOr7qdIlu0GcGOd2vjDRQRvSsD8iD7JC5yKdAXb78d/?=
 =?us-ascii?Q?wuEJbYz09cp+bymCeocRgF556Dcjt5fltAeZ67yDj2n+OSKXxEmO3V6DbMLW?=
 =?us-ascii?Q?0u2tON/h9J/KeZ6sjV9ILQoiUWKfqPQe90hJTAWA62GBS8sz/8rciMlvw3Vm?=
 =?us-ascii?Q?Dxxgfjsj37qEtkqfuoqdHzbWaCg2/ZG7MQ60KTxA5FPysg3KpN1yzrXieLpP?=
 =?us-ascii?Q?Ycg6keENfN9mPsb0SCtj+Q/5mlVDESkoL4TAMgpdjAe6Qy2CAyusTQ4JaeZU?=
 =?us-ascii?Q?2TQmKcD+3N7rK2GAJmNyRyPrhzaofcc3RHtRZiH8nsP4ULv3GsxaYIyFKrNn?=
 =?us-ascii?Q?s3TKcMdm6porGdAWeiO4OLGwS1+9NEKLzI1/jUVO/td5yCL1I2mqf5HThFRu?=
 =?us-ascii?Q?M+cYQDMROXbwy5o0g7fP6ac8/kq5cLQKnkWLVv3kXwi1+UCllezod4rkVXH9?=
 =?us-ascii?Q?D3Jj+SyW4fzqkM30VP0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616f13e6-f236-43e6-89af-08db5a93ccda
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 07:11:44.6013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nD989BroE6GHu60FUrUsSQPu+fgFmPl/5fO+UuDh1qJyGRfPWkXSr45S4N0qhJWnEe8G9RwQEE+am6Gr4PFBcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788
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

Hi Jani,
Thanks for your time!
Comments inline.

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Tuesday, May 16, 2023 6:34 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: lyude@redhat.com; ville.syrjala@linux.intel.com; imre.deak@intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>;
> stable@vger.kernel.org
> Subject: Re: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new
> message
>
> On Thu, 27 Apr 2023, Wayne Lin <Wayne.Lin@amd.com> wrote:
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
> > avoid it.
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
> ++++++++++++++++---
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
> dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
> >             DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0],
> esi[1], esi[2]);
> >             /* handle HPD short pulse irq */
> >             if (aconnector->mst_mgr.mst_state)
> > -                   drm_dp_mst_hpd_irq(
> > -                           &aconnector->mst_mgr,
> > -                           esi,
> > -                           &new_irq_handled);
> > +                   drm_dp_mst_hpd_irq_step1(&aconnector->mst_mgr,
> > +                                            esi,
> > +                                            &new_irq_handled);
> >
> >             if (new_irq_handled) {
> >                     /* ACK at DPCD to notify down stream */ @@ -
> 3281,6 +3280,7 @@
> > static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector
> *aconnector)
> >                                     break;
> >                     }
> >
> > +                   drm_dp_mst_hpd_irq_step2(&aconnector-
> >mst_mgr);
> >                     /* check if there is new irq to be handled */
> >                     dret =3D drm_dp_dpcd_read(
> >                             &aconnector->dm_dp_aux.aux,
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
> drm_dp_mst_topology_mgr *mgr)
> >   * topology manager will process the sideband messages received as a r=
esult
> >   * of this.
> >   */
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> > bool *handled)
> > +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> u8
> > +*esi, bool *handled)
>
> If you're changing the signature of the function, I'd make esi "const u8 =
*esi",
> and add a separate "u8 *ack" that you have to provide, where this functio=
n
> would |=3D the flags to ack. It would be useful at least in i915.

Will adjust. Thanks.

>
> As to naming, _step1 and _step2 are pretty vague.

Was trying to align the naming method we used for payload allocation/de-all=
ocation.
Anyway, I'll adjust the naming here.

>
> >  {
> >     int ret =3D 0;
> >     int sc;
> > @@ -4077,11 +4077,38 @@ int drm_dp_mst_hpd_irq(struct
> drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
> >             *handled =3D true;
> >     }
> >
> > -   drm_dp_mst_kick_tx(mgr);
> >     return ret;
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
>
> _done, _finish, _complete?

Will use "complete". Thanks.

>
> > +{
> > +   struct drm_dp_sideband_msg_tx *txmsg;
> > +   bool skip =3D false;
> >
> > +   mutex_lock(&mgr->qlock);
> > +   txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> > +                                    struct drm_dp_sideband_msg_tx,
> next);
> > +   /* If last transaction is not completed yet*/
> > +   if (!txmsg ||
> > +       txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> > +       txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> > +           skip =3D true;
> > +   mutex_unlock(&mgr->qlock);
> > +
> > +   if (!skip)
>
> Please avoid negatives like this. You could have bool kick =3D true inste=
ad.

Thanks. Will modify it.

>
> > +           drm_dp_mst_kick_tx(mgr);
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
> >     bool handled =3D false;
> >
> > -   drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> > +   drm_dp_mst_hpd_irq_step1(&intel_dp->mst_mgr, esi, &handled);
> >     if (handled)
> >             ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY);
> >
> > @@ -3880,6 +3880,9 @@ intel_dp_check_mst_status(struct intel_dp
> > *intel_dp)
> >
> >             if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
> >                     drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> > +
> > +           if (ack[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY))
> > +                   drm_dp_mst_hpd_irq_step2(&intel_dp->mst_mgr);
>
> I'm getting confused about the division of responsibilities between the t=
wo
> functions to be called, and the caller. Why does i915 do things different=
ly from
> nouveau and amd wrt this?

The main idea is trying to ack the irq before sending a new request. We use=
d to
send a new request before acking the irq event which will cause message int=
erleaving
and that's not recommended by DP spec.

amd and nouveau only handle mst up/down message irq events while calling
drm_dp_mst_hpd_irq() but i915 also tries to handle content protection irq w=
hile
handling mst events. That's why it's a bit different between amd/nouveau an=
d i915.

>
> >     }
> >
> >     return link_ok;
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index ed9d374147b8..00c36fcc8afd 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1332,12 +1332,15 @@ nv50_mstm_service(struct nouveau_drm
> *drm,
> >                     break;
> >             }
> >
> > -           drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> > +           drm_dp_mst_hpd_irq_step1(&mstm->mgr, esi, &handled);
> >             if (!handled)
> >                     break;
> >
> >             rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1,
> &esi[1],
> >                                    3);
> > +
> > +           drm_dp_mst_hpd_irq_step2(&mstm->mgr);
> > +
>
> Don't you think the return value should be checked first?

Sorry I missed it. Will adjust. Thanks!

>
> >             if (rc !=3D 3) {
> >                     ret =3D false;
> >                     break;
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
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> > bool *handled);
> > -
> > +int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr,
> u8
> > +*esi, bool *handled); void drm_dp_mst_hpd_irq_step2(struct
> > +drm_dp_mst_topology_mgr *mgr);
> >
> >  int
> >  drm_dp_mst_detect_port(struct drm_connector *connector,
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--
Regards,
Wayne Lin
