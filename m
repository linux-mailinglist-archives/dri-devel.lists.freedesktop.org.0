Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2523E728E21
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 04:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779510E095;
	Fri,  9 Jun 2023 02:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B3C10E002;
 Fri,  9 Jun 2023 02:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbvBNCxEXhmVruerqT+ntVfIiVLGr9VVVb92QqfG1OycYqAWcku/9Dj9uxDkaQN44uVtbseuuyEyBlINhBjVpOc21AgVINRMRbV8XIilmkmjymDVAcwkGZiqlsI5ykMmeNrg9CIVkAgvI2N4aKwSwvQPLwe6qhAEVAgAYEKjNScIRniC74YDtdoBtjx2jEcodtVhcbjkMYBLrK6iDx9HsI0OF9Jv81V0c32PtAVJurF8lh40qBZQVRKpuZsbc8kVs15SqUdf1aGlcc8CeXjFNzoZ6rFd40X6x6PEx22cM8Lf6cyA1T+Qd5BVHdLYvxDP9lu9I+7s05uHefvppp0hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR0bIVYmGaG34/5r6EO1kvMq+wYrs1wX4jIF64S/Fro=;
 b=hIGs5VNzpAqsTSo+PWiNnhJAsZXawhLuz6oxEHn3Kh8Ww0NCTYyw27SUMZRTOmMS+acau1NgymeRGSoWcXwOMGpADprsDr4H9lOjKMmzukZLybjp5Ix8xMfJiw7uZCyWlowDVgl3mLn/nyAWZ6gwBMUv8a63u37MmY0JUmNXS0B+ius3JM+eOASRsDXwdfGXPllyr/+ZRHObd61TJ4XBH5DZ6BfvKaSgHkMogheF5Znbg/W12tzyC77XMnd9lI8i4kqvspP1nPPSzvUyaibkbeQKauBnZKnUqZ05KM806rWNGw4lxG2Cv6FNVpvFVDedtUSrvDmSbzDvHeT5A1op5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR0bIVYmGaG34/5r6EO1kvMq+wYrs1wX4jIF64S/Fro=;
 b=BOJ2VMiAkw4hudvZgmQakRG6kKs2Ruo9OYrbD5duynsWsG0V94HM5zYovI0wmUodVwM4m2ZvhxcfCTY7e4Wkvjags4vuYkKz4voBTNLXz85Lw3aalHIQISbiaU2HMANLKGn4QmpPGk5v+A0zZ3ohrS3uRUq+TXThCxeZ7ALlj4M=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 02:45:50 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::caf0:704b:6692:9932]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::caf0:704b:6692:9932%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 02:45:50 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Topic: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Index: AQHZmf6VHDyJTDyps0ObC1UNCjARGa+A1NIAgADs+HA=
Date: Fri, 9 Jun 2023 02:45:50 +0000
Message-ID: <CO6PR12MB548948F83852B367F228F9A9FC51A@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230608114316.3078024-1-Wayne.Lin@amd.com>
 <87a5xarvh9.fsf@intel.com>
In-Reply-To: <87a5xarvh9.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=0abf0d92-dd19-49f8-b720-aff8007bdeb7;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-09T02:34:28Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SA3PR12MB7808:EE_
x-ms-office365-filtering-correlation-id: c2114414-bddf-401b-fab7-08db6893a2c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1K3s6e16NOTxxf2gBbyqv3nMj2NiQZK5j2g2pD/b3Z7f3HsRjLnZuXE78FNo5jQRKT+eCOHVhi4gUC1k1unuU6/O/walGKKyXKq1K2C0DI38TsdYoxso+UT8ZqwbrTPYTTO4J55pL/fxFOByWeQeQe2FMqIyqf1sSdBboB+9oEXUiZoZbGUabXiNW9sJhcS0aSbqMKlVthAtEZyit8ghMiRNXY8Ud7xx0EmeH7cGQFNqhAh7lUdccqagIEsDjsBCmaepSqxHS4n6paWDxudFn6wP8Ua6chua0X1+q3Kg5XfSPj3G8QfVgSr2+e+8htT0evkpSsvo01kViAbAEeWosikHOkWIArHqOtIVwS7D8bb9QQDohTxplJpw+0imuj4n859pUJfH+u1PYfkbsWR0OKKSNTcxDbRcRaM7guOCXIGxWJ7M+ZkSmQSecSVtiMYS5s6uoVBDkY3k4Mr8tjEgDo6fZd5GqieFjXEJHpZD+/xRps2E5kTfn2nJ4yeB4DETduruKebVnYeD1D/6expJCziXYM9k1g81PHtLyMcQLh054otzD6DQ2FEXIZC2yUmRH4ohpdYJFc6n7KN6r4TAz7UU2/koJdPT5WZSLLRgZN/AXksFmxvhproI9sFnjtKM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(30864003)(2906002)(15650500001)(52536014)(5660300002)(8936002)(41300700001)(316002)(64756008)(4326008)(66476007)(66446008)(66946007)(76116006)(66556008)(54906003)(110136005)(478600001)(8676002)(7696005)(71200400001)(53546011)(55236004)(186003)(86362001)(55016003)(33656002)(83380400001)(38070700005)(9686003)(26005)(6506007)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XRLXukCVJHRz/GMzSodnas8B4vbYOirEYlDDHAiMOec0Gdlg5p7PJTjBnoMw?=
 =?us-ascii?Q?N0aSqMjn80RkXtlQCRAK7S1RCJxu9xLD4VYamRZRkT+EyF6Qb6EexBph2NQG?=
 =?us-ascii?Q?s26AW1d/MA4gK855wB61lZMyjWToYTdALE2u0wSm/fui4hsInkJSVRGV+ysg?=
 =?us-ascii?Q?KjQTCpjv+dp4VvDWAhJ9zHDSwZ2d6J5M4sSVUUZWv1wug4LPlwlT28db9A+C?=
 =?us-ascii?Q?TlTIR3baDAFs3U9tyNKHySgeBBfoBUkWj5aeN9NRtsSS/UxBI25jyoeYAiEc?=
 =?us-ascii?Q?0BlMF31gPfpEIKytL/YQD83bba8omrICvfZJ5WGKk7DZjUSyi0snwW9f87ZP?=
 =?us-ascii?Q?tuM080CeJc/rcgmgNy0qmfjSLPknj+mf8FIvCogRiop1zz3K+l4ULBpBKQSW?=
 =?us-ascii?Q?5hVB6I8bkRkSkzkf4PiqJl1icbwnYPAduyxV+CvR298iiZD2MzGODVuV+m/r?=
 =?us-ascii?Q?O20cn/bo9y4DJbuaIeA8wWE82MDG3LZHZu9MbImdE8CcbXCPh8IAzG92L+6M?=
 =?us-ascii?Q?NPDxaADrCy9GL33CKwft0so/9WoRnb7K5WmzMh1eDQqw/LvPwHbAqZL1rVy6?=
 =?us-ascii?Q?GmNhhwICunWeAbENyMRNkxS48LOlV4Xgx5lHh5VtD501ULfgc8hVchceT7pS?=
 =?us-ascii?Q?fcZc6pTJihBSHVAOYwuvR116diIUTWSBtIwfybpoicXyz0rcfVhViKtvoY2k?=
 =?us-ascii?Q?ooKOE+OxkL5ArYwUKbRxeopsjM8xqwl84cK4qHY17iMQfyNXcuN/pUyD/HDw?=
 =?us-ascii?Q?HYUCWOV5DfyZI8ET0ISV9R22Osrj+rSCA9FrYfAqhajs+ltS3sQaD4ZyU+He?=
 =?us-ascii?Q?reEvLS0Sg9h2LV9kipdjlemV5JDxTer9bwRDwsjLHQuJso+yazF4KmtPvW9f?=
 =?us-ascii?Q?9EgwYUxBl1nj6ziRd0nHex1F2L2C9NeSMA3+1IoNw++gyNPMNQutHIIWqj0L?=
 =?us-ascii?Q?BXYTWzI2QfFqQkqJYWFXPmc0jGIabdH4QWR1duk0tjpmGUiRVnG7/6jMCBbJ?=
 =?us-ascii?Q?Uh4Q4QnQ+fGIgivqH6NzRal+jXu6arUhOybcow7gL8btkWjg6bG7aGI905eU?=
 =?us-ascii?Q?I8w/yz7Euyc09G6OshzZQ3Fbw8A2x7mkuR3i0zZmqSfLypZtgPXVwfxUk2dM?=
 =?us-ascii?Q?ZyBJRJLgC0idPX7OcQ4q6C3TMl948+Z/3oPNffeHZDRyWBiw76/f35nEHmY7?=
 =?us-ascii?Q?k+SLaly6moKacKvx/TeWXYwfsm8JKrwWeOtP+ET+Cgd8AXwZ3TN0i/vpUjpq?=
 =?us-ascii?Q?Zzm8jGH+ZFGU/CakV+AqxIRTSzaWJtlMBrQmFCNU74OAAjFKB0MgYGThzc+W?=
 =?us-ascii?Q?UJx6zvZ2M8YjJmuUuNSurrOt3c74PHvsrVqHAi9npFIuVUmXtuthQo6Nafdx?=
 =?us-ascii?Q?pdC0yB9dX4AAaQeSV1VsuwqhH78ckwbyqkhoeYyhfxPfC/ic7Sjf5BiF8mPN?=
 =?us-ascii?Q?M1BNzfJTO6a+mp0eE1m/ICpASAh8tGrafcipxvT1Rm/2IG00nxlCMWFvFJpL?=
 =?us-ascii?Q?1Yu5k+nCKgY2XsNiE5Fx9HrmHs9fKLIhIpDTAixXDy3HkKQ+tgWooLPJF6qe?=
 =?us-ascii?Q?tOHoO9xVlWPXuAZ4tEA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2114414-bddf-401b-fab7-08db6893a2c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 02:45:50.3506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1APLyW+JSADlUAABU9IR6/VqLLcqVA+tVm79pLRhbOuJYPJWmjZt6vsjRIdJ1C5gZwdOy6qI9HE8zLWF24oAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
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

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Thursday, June 8, 2023 8:26 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: lyude@redhat.com; ville.syrjala@linux.intel.com; imre.deak@intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>;
> stable@vger.kernel.org
> Subject: Re: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
> message
>
> On Thu, 08 Jun 2023, Wayne Lin <Wayne.Lin@amd.com> wrote:
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
> > event, driver calls drm_dp_mst_hpd_irq_send_new_request() and might
> > trigger drm_dp_mst_kick_tx() only when there is no on going message
> > transaction.
> >
> > Changes since v1:
> > * Reworked on review comments received
> > -> Adjust the fix to let driver explicitly kick off new down request
> > when mst irq event is handled and acked
> > -> Adjust the commit message
> >
> > Changes since v2:
> > * Adjust the commit message
> > * Adjust the naming of the divided 2 functions and add a new input
> >   parameter "ack".
> > * Adjust code flow as per review comments.
> >
> > Changes since v3:
> > * Update the function description of drm_dp_mst_hpd_irq_handle_event
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 ++++++------
> > drivers/gpu/drm/display/drm_dp_mst_topology.c | 54
> ++++++++++++++++---
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
> >  include/drm/display/drm_dp_mst_helper.h       |  7 ++-
> >  5 files changed, 82 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index d5cec03eaa8d..597c3368bcfb 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3236,6 +3236,7 @@ static void dm_handle_mst_sideband_msg(struct
> > amdgpu_dm_connector *aconnector)  {
> >     u8 esi[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] =3D { 0 };
> >     u8 dret;
> > +   u8 ack;
> >     bool new_irq_handled =3D false;
> >     int dpcd_addr;
> >     int dpcd_bytes_to_read;
> > @@ -3265,34 +3266,36 @@ static void
> dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
> >             process_count < max_process_count) {
> >             u8 retry;
> >             dret =3D 0;
> > +           ack =3D 0;
> >
> >             process_count++;
> >
> >             DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0],
> esi[1], esi[2]);
> >             /* handle HPD short pulse irq */
> >             if (aconnector->mst_mgr.mst_state)
> > -                   drm_dp_mst_hpd_irq(
> > -                           &aconnector->mst_mgr,
> > -                           esi,
> > -                           &new_irq_handled);
> > +                   drm_dp_mst_hpd_irq_handle_event(&aconnector-
> >mst_mgr,
> > +                                                   esi,
> > +                                                   &ack,
> > +                                                   &new_irq_handled);
> >
> >             if (new_irq_handled) {
> >                     /* ACK at DPCD to notify down stream */
> > -                   const int ack_dpcd_bytes_to_write =3D
> > -                           dpcd_bytes_to_read - 1;
> > -
> >                     for (retry =3D 0; retry < 3; retry++) {
> > -                           u8 wret;
> > -
> > -                           wret =3D drm_dp_dpcd_write(
> > -                                   &aconnector->dm_dp_aux.aux,
> > -                                   dpcd_addr + 1,
> > -                                   &esi[1],
> > -                                   ack_dpcd_bytes_to_write);
> > -                           if (wret =3D=3D ack_dpcd_bytes_to_write)
> > +                           ssize_t wret;
> > +
> > +                           wret =3D drm_dp_dpcd_writeb(&aconnector-
> >dm_dp_aux.aux,
> > +                                                     dpcd_addr + 1,
> > +                                                     ack);
> > +                           if (wret =3D=3D 1)
> >                                     break;
> >                     }
> >
> > +                   if (retry =3D=3D 3) {
> > +                           DRM_ERROR("Failed to ack MST event.\n");
> > +                           return;
> > +                   }
> > +
> > +
>       drm_dp_mst_hpd_irq_send_new_request(&aconnector->mst_mgr);
> >                     /* check if there is new irq to be handled */
> >                     dret =3D drm_dp_dpcd_read(
> >                             &aconnector->dm_dp_aux.aux,
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 38dab76ae69e..3a018f5b604c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4053,17 +4053,28 @@ static int drm_dp_mst_handle_up_req(struct
> > drm_dp_mst_topology_mgr *mgr)  }
> >
> >  /**
> > - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> > + * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST
> > + event
> >   * @mgr: manager to notify irq for.
> >   * @esi: 4 bytes from SINK_COUNT_ESI
> > + * @ack: flags of events to ack
> >   * @handled: whether the hpd interrupt was consumed or not
> >   *
> > - * This should be called from the driver when it detects a short IRQ,
> > + * This should be called from the driver when it detects a HPD IRQ,
> >   * along with the value of the DEVICE_SERVICE_IRQ_VECTOR_ESI0. The
> > - * topology manager will process the sideband messages received as a
> > result
> > - * of this.
> > + * topology manager will process the sideband messages received
> > + * as indicated in the DEVICE_SERVICE_IRQ_VECTOR_ESI0 and set the
> > + * corresponding flags that Driver has to ack the DP receiver later.
> > + *
> > + * Note that driver shall also call
> > + * drm_dp_mst_hpd_irq_send_new_request() if the 'handled' is set
> > + * after calling this function, to try to kick off a new request in
> > + * the queue if the previous message transaction is completed.
> > + *
> > + * See also:
> > + * drm_dp_mst_hpd_irq_send_new_request()
> >   */
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> > bool *handled)
> > +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr
> *mgr, const u8 *esi,
> > +                               u8 *ack, bool *handled)
> >  {
> >     int ret =3D 0;
> >     int sc;
> > @@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct
> drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
> >     if (esi[1] & DP_DOWN_REP_MSG_RDY) {
> >             ret =3D drm_dp_mst_handle_down_rep(mgr);
> >             *handled =3D true;
> > +           *ack |=3D DP_DOWN_REP_MSG_RDY;
>
> My idea was that esi and ack would be the same size buffers, so the calle=
r
> wouldn't have to worry where exactly to point ack to.
>
> I think the asymmetry here is misleading, with ack and esi having to poin=
t at
> different locations.
>
Thanks, Jani.

But Event status Indicator Files (DPCD 0x2000h ~ 0x21FFH) are not all desig=
ned
to be ack clear, e.g. esi[0] here. My thought is to be precise about what i=
s handled
and what is going to be ack clear. Otherwise, write ack[0] to DPCD 0x2002h =
is
not reasonable.

Regards,
Wayne
> BR,
> Jani.
>
>
>
> >     }
> >
> >     if (esi[1] & DP_UP_REQ_MSG_RDY) {
> >             ret |=3D drm_dp_mst_handle_up_req(mgr);
> >             *handled =3D true;
> > +           *ack |=3D DP_UP_REQ_MSG_RDY;
> >     }
> >
> > -   drm_dp_mst_kick_tx(mgr);
> >     return ret;
> >  }
> > -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> > +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_handle_event);
> >
> > +/**
> > + * drm_dp_mst_hpd_irq_send_new_request() - MST hotplug IRQ kick off
> > +new request
> > + * @mgr: manager to notify irq for.
> > + *
> > + * This should be called from the driver when mst irq event is
> > +handled
> > + * and acked. Note that new down request should only be sent when
> > + * previous message transaction is completed. Source is not supposed
> > +to generate
> > + * interleaved message transactions.
> > + */
> > +void drm_dp_mst_hpd_irq_send_new_request(struct
> > +drm_dp_mst_topology_mgr *mgr) {
> > +   struct drm_dp_sideband_msg_tx *txmsg;
> > +   bool kick =3D true;
> > +
> > +   mutex_lock(&mgr->qlock);
> > +   txmsg =3D list_first_entry_or_null(&mgr->tx_msg_downq,
> > +                                    struct drm_dp_sideband_msg_tx,
> next);
> > +   /* If last transaction is not completed yet*/
> > +   if (!txmsg ||
> > +       txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> > +       txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
> > +           kick =3D false;
> > +   mutex_unlock(&mgr->qlock);
> > +
> > +   if (kick)
> > +           drm_dp_mst_kick_tx(mgr);
> > +}
> > +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_send_new_request);
> >  /**
> >   * drm_dp_mst_detect_port() - get connection status for an MST port
> >   * @connector: DRM connector for this port diff --git
> > a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 4bec8cd7979f..f24602887015 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp,
> > u8 *esi, u8 *ack)  {
> >     bool handled =3D false;
> >
> > -   drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> > -   if (handled)
> > -           ack[1] |=3D esi[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY);
> > +   drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi,
> &ack[1],
> > +&handled);
> >
> >     if (esi[1] & DP_CP_IRQ) {
> >             intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
> > @@ -4139,6 +4137,9 @@ intel_dp_check_mst_status(struct intel_dp
> > *intel_dp)
> >
> >             if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
> >                     drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> > +
> > +           if (ack[1] & (DP_DOWN_REP_MSG_RDY |
> DP_UP_REQ_MSG_RDY))
> > +                   drm_dp_mst_hpd_irq_send_new_request(&intel_dp-
> >mst_mgr);
> >     }
> >
> >     return link_ok;
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 9b6824f6b9e4..b2d9978e88a8 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1357,6 +1357,7 @@ nv50_mstm_service(struct nouveau_drm *drm,
> >     bool handled =3D true, ret =3D true;
> >     int rc;
> >     u8 esi[8] =3D {};
> > +   u8 ack;
> >
> >     while (handled) {
> >             rc =3D drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
> @@ -1365,16
> > +1366,19 @@ nv50_mstm_service(struct nouveau_drm *drm,
> >                     break;
> >             }
> >
> > -           drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> > +           ack =3D 0;
> > +           drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, &ack,
> &handled);
> >             if (!handled)
> >                     break;
> >
> > -           rc =3D drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1,
> &esi[1],
> > -                                  3);
> > -           if (rc !=3D 3) {
> > +           rc =3D drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1,
> ack);
> > +
> > +           if (rc !=3D 1) {
> >                     ret =3D false;
> >                     break;
> >             }
> > +
> > +           drm_dp_mst_hpd_irq_send_new_request(&mstm->mgr);
> >     }
> >
> >     if (!ret)
> > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > b/include/drm/display/drm_dp_mst_helper.h
> > index 32c764fb9cb5..40e855c8407c 100644
> > --- a/include/drm/display/drm_dp_mst_helper.h
> > +++ b/include/drm/display/drm_dp_mst_helper.h
> > @@ -815,8 +815,11 @@ void drm_dp_mst_topology_mgr_destroy(struct
> > drm_dp_mst_topology_mgr *mgr);  bool drm_dp_read_mst_cap(struct
> > drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);  int
> > drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr
> *mgr,
> > bool mst_state);
> >
> > -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi,
> > bool *handled);
> > -
> > +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr
> *mgr,
> > +                               const u8 *esi,
> > +                               u8 *ack,
> > +                               bool *handled);
> > +void drm_dp_mst_hpd_irq_send_new_request(struct
> > +drm_dp_mst_topology_mgr *mgr);
> >
> >  int
> >  drm_dp_mst_detect_port(struct drm_connector *connector,
>
> --
> Jani Nikula, Intel Open Source Graphics Center
