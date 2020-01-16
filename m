Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF213D1E7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 03:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572506EBA7;
	Thu, 16 Jan 2020 02:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45906EBA6;
 Thu, 16 Jan 2020 02:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yigxs6mz3Ny6+TQw/gFMBCmaLyySyqWy2Nbv2JfziRD895FaZUEUqOknzcFyd8wy60giTnS+GRxwzMNWrIkWqpJP1PNKIlUh+yvbPPeVl4ZAfhbspeelFBfVJk15H8eygD4TQfIj0SWqize4z7Lk+mcxEFtDuWwKocsrW00UKBp+6/zDiyBfkEksIsx1ivQSzCFGIwFd4+RzYROyNvRbLlY9a4HDKNc3EsS2R8u7zy5ceSGyW3aZ8U557lPOkhNAzJWmz5DOkpUNML9CwOlzPz6gvRLiw+piI7NWYDEpMKU1cEqHwMQsiHBwd+MawFEpxzXfRONbN5fXk5cnyAyMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seVVm55yN/dXElouDZSFL0Ps+nsjfWCIkxSy5WonjBg=;
 b=Fwt3XA89B/+N33QMFrx8+QWX0+uxGc7zm9xrzc+4i7nIOBGujl/nA8Ix+oCmRBle1bNZzHtOltALb2G673+4eXUc31jo6J0fcMB8+4IiWIwBH1yy1kdlrxvTP/K/8FFibJGIrHP6pcrXTmgLFRDL56yk0eApziVJk4twdehbTzJoXjXBdQ3vGhheJUNg3rxPI2t9inV/ySvBf5IkpK5493T/op3P2g8OmIQpkKl0HfZlwWZ6WOLL3jm4X+eKFc+UCpcQ/j7EHMCCpBEyeyM/4IGN1beSzXw1F00yp4zmn/hJ4QKAvWinIqQPdP9vgZZUnSTL5vZcyYk6NSZCxbClHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seVVm55yN/dXElouDZSFL0Ps+nsjfWCIkxSy5WonjBg=;
 b=2D7G/qfjSlJnv4iiGCTmXHILgtNYlkwEyOYgWmsM285t3mnqtKRea5Sf9km0j5ci70xaMmoeJ66UKB9IWXF92cmHsNGlOFO5iuPYwwxwZU3wzllvdrIhzraXfsgmWkQ/YbscwZJ8gXlUcgghB7EZL78iEY5twgO+OL1E0CHuy74=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB2810.namprd12.prod.outlook.com (20.176.118.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 02:09:42 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 02:09:41 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
Thread-Topic: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
Thread-Index: AQHVyfUbuOCcXK3SL0+leoduf4KwfafsSd8AgABFQwA=
Date: Thu, 16 Jan 2020 02:09:41 +0000
Message-ID: <DM6PR12MB41378C04F449704195EB1149FC360@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200113093649.11755-1-Wayne.Lin@amd.com>
 <f7b0b918e56aac5ef184ca3f8c2d43f9f202b189.camel@redhat.com>
In-Reply-To: <f7b0b918e56aac5ef184ca3f8c2d43f9f202b189.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-16T02:06:18Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=849fb9de-9fee-4215-80bc-0000b8fbebb6;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-16T02:09:39Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 2ea662d2-9c78-45ba-b2b4-0000ac836e0a
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 72ac933f-1b4f-4c9a-b5e3-08d79a292605
x-ms-traffictypediagnostic: DM6PR12MB2810:|DM6PR12MB2810:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2810518B581828AD7F528B3CFC360@DM6PR12MB2810.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(55016002)(5660300002)(52536014)(478600001)(9686003)(26005)(186003)(71200400001)(33656002)(4326008)(2906002)(76116006)(6506007)(316002)(66446008)(54906003)(66946007)(7696005)(8676002)(86362001)(66556008)(81156014)(64756008)(66476007)(8936002)(110136005)(81166006)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2810;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q7/MdS4NdtJJds4eTXWoyTYg/HkdGf9YRnyGyJp2LGyKxO7IaniNFhddiv8gbnT9LGaYvHq3J7poyLyp38Ngi5iX+uEKPPRHFZtAZ17jHbppjmD5DnORI/AWLR5Ifv3NOe3rWX6Bcq2MTPipoabRTxqg9X7YLxbZEa7cFnL+0FQLYita4NZ+a/JM04tkTL7QYqKOadvTVr79coDy6g7SZShVHWbjFey/fZzivYrctWz6GkC7qdzSgdPSp/FvXXEzpEhGUC8Q7jS8f5aqcKyBZo7mZz5sBZlXYJShswWQVEA9F3gSK70qaPj0wBcHYw5gAtchfmYT+FpN8QCSzczGyUU2ldI/jcD/8yL6+11/ZzUr60GndVulul18ZefcO36Ek9nMM3cf6LUbi1turIKr1rUvxSdGVcDn8ZymEGmCNP+1sG6dUU0zEkKSKHwpgS46
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ac933f-1b4f-4c9a-b5e3-08d79a292605
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 02:09:41.6607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xau0/9OycMMTabWsyt0gOnyBzUlmd8/Kx6Sa2Pbo034QLIlancmBnyMAEOcTPnQSkNux6PsJp2jFy0vob/h7Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2810
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Appreciate for your time.
Thanks!

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, January 16, 2020 5:58 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> I will push this to drm-misc-fixes in just a moment, thanks!
> 
> On Mon, 2020-01-13 at 17:36 +0800, Wayne Lin wrote:
> > [Why]
> > Noticed this while testing MST with the 4 ports MST hub from
> > StarTech.com. Sometimes can't light up monitors normally and get the
> > error message as 'sideband msg build failed'.
> >
> > Look into aux transactions, found out that source sometimes will send
> > out another down request before receiving the down reply of the
> > previous down request. On the other hand, in drm_dp_get_one_sb_msg(),
> > current code doesn't handle the interleaved replies case. Hence,
> > source can't build up message completely and can't light up monitors.
> >
> > [How]
> > For good compatibility, enforce source to send out one down request at
> > a time. Add a flag, is_waiting_for_dwn_reply, to determine if the
> > source can send out a down request immediately or not.
> >
> > - Check the flag before calling process_single_down_tx_qlock to send
> > out a msg
> > - Set the flag when successfully send out a down request
> > - Clear the flag when successfully build up a down reply
> > - Clear the flag when find erros during sending out a down request
> > - Clear the flag when find errors during building up a down reply
> > - Clear the flag when timeout occurs during waiting for a down reply
> > - Use drm_dp_mst_kick_tx() to try to send another down request in
> > queue at the end of drm_dp_mst_wait_tx_reply() (attempt to send out
> > messages in queue when errors occur)
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
> >  include/drm/drm_dp_mst_helper.h       |  6 ++++++
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 4395d5cc0645..3542af15387a 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -1195,6 +1195,8 @@ static int drm_dp_mst_wait_tx_reply(struct
> > drm_dp_mst_branch *mstb,
> >  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
> >  			mstb->tx_slots[txmsg->seqno] = NULL;
> >  		}
> > +		mgr->is_waiting_for_dwn_reply = false;
> > +
> >  	}
> >  out:
> >  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) { @@
> > -1204,6 +1206,7 @@ static int drm_dp_mst_wait_tx_reply(struct
> > drm_dp_mst_branch *mstb,
> >  	}
> >  	mutex_unlock(&mgr->qlock);
> >
> > +	drm_dp_mst_kick_tx(mgr);
> >  	return ret;
> >  }
> >
> > @@ -2770,9 +2773,11 @@ static void process_single_down_tx_qlock(struct
> > drm_dp_mst_topology_mgr *mgr)
> >  	ret = process_single_tx_qlock(mgr, txmsg, false);
> >  	if (ret == 1) {
> >  		/* txmsg is sent it should be in the slots now */
> > +		mgr->is_waiting_for_dwn_reply = true;
> >  		list_del(&txmsg->next);
> >  	} else if (ret) {
> >  		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> > +		mgr->is_waiting_for_dwn_reply = false;
> >  		list_del(&txmsg->next);
> >  		if (txmsg->seqno != -1)
> >  			txmsg->dst->tx_slots[txmsg->seqno] = NULL; @@ -2812,7
> +2817,8 @@
> > static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
> >  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> >  	}
> >
> > -	if (list_is_singular(&mgr->tx_msg_downq))
> > +	if (list_is_singular(&mgr->tx_msg_downq) &&
> > +	    !mgr->is_waiting_for_dwn_reply)
> >  		process_single_down_tx_qlock(mgr);
> >  	mutex_unlock(&mgr->qlock);
> >  }
> > @@ -3743,6 +3749,7 @@ static int drm_dp_mst_handle_down_rep(struct
> > drm_dp_mst_topology_mgr *mgr)
> >  	mutex_lock(&mgr->qlock);
> >  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> >  	mstb->tx_slots[slot] = NULL;
> > +	mgr->is_waiting_for_dwn_reply = false;
> >  	mutex_unlock(&mgr->qlock);
> >
> >  	wake_up_all(&mgr->tx_waitq);
> > @@ -3752,6 +3759,9 @@ static int drm_dp_mst_handle_down_rep(struct
> > drm_dp_mst_topology_mgr *mgr)
> >  no_msg:
> >  	drm_dp_mst_topology_put_mstb(mstb);
> >  clear_down_rep_recv:
> > +	mutex_lock(&mgr->qlock);
> > +	mgr->is_waiting_for_dwn_reply = false;
> > +	mutex_unlock(&mgr->qlock);
> >  	memset(&mgr->down_rep_recv, 0, sizeof(struct
> > drm_dp_sideband_msg_rx));
> >
> >  	return 0;
> > @@ -4591,7 +4601,7 @@ static void drm_dp_tx_work(struct work_struct
> *work)
> >  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct
> > drm_dp_mst_topology_mgr, tx_work);
> >
> >  	mutex_lock(&mgr->qlock);
> > -	if (!list_empty(&mgr->tx_msg_downq))
> > +	if (!list_empty(&mgr->tx_msg_downq) &&
> > +!mgr->is_waiting_for_dwn_reply)
> >  		process_single_down_tx_qlock(mgr);
> >  	mutex_unlock(&mgr->qlock);
> >  }
> > diff --git a/include/drm/drm_dp_mst_helper.h
> > b/include/drm/drm_dp_mst_helper.h index 942575de86a0..d0b45468135a
> > 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -610,6 +610,12 @@ struct drm_dp_mst_topology_mgr {
> >  	 * &drm_dp_sideband_msg_tx.state once they are queued
> >  	 */
> >  	struct mutex qlock;
> > +
> > +	/**
> > +	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> > reply
> > +	 */
> > +	bool is_waiting_for_dwn_reply;
> > +
> >  	/**
> >  	 * @tx_msg_downq: List of pending down replies.
> >  	 */
> --
> Cheers,
> 	Lyude Paul
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
