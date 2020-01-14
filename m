Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88791139FA8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 04:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D516E1D7;
	Tue, 14 Jan 2020 03:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802CA6E1D7;
 Tue, 14 Jan 2020 03:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU9KSbJKyvOoolXkNdEO3pnYOvm0XciQPdZGmVqKltvXpQzYPn2K1wHKPLZ6Vvz+sH986cjTfQOFgp3W6sdZmKW6G49lQA7gpl8dVNixAEv5og9pAnKvZOfyYul17+Z+4k1g0Q/h7/lT5ce11IVJffmLZBzm8lB/eUSi0tQVfu9/xfPLtJ+5ByySQ/xP7fH5XtNf1X4LncqUZNcHGtIcMmnmparo20elteGnNj4AcBck44Vt7wVCkni1w73SlKzEpPlxzR8LuVIvroOdG3zvjPh8FtiI0NSuz7EUKdPlBXSIOsjjqOtxSevm35qFH+HYZth8CQq+Z5RvBWENzz4PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPSUE2QCxTHbPuJ+qgdmRtnQY8qYEQITPagFMXUYoTk=;
 b=iuAwKNuuskckGon7yIf0gwRfJSApAAQRoJQGI+h51DGzxEwFHe/Sb84Qcx8c4LfZ6L0hMVWUUFxoVsF8ZvHLfLwXFmV4POjep7T+s3+GJqUkPeC321REfIeSnS5LnndNSvCeKM3SLeEeicrgdYLbfxr4etUJpbI+4lbIvdL02S90Jd6T1GS/fyPel+VxkbKfw2n3eYnKqQpChaA3wXy82L6txjpT8WRfDPv+Tvj7h2IgSjlOMXnejdux+Fv/tHLL7mhrXLHaNap+t9Q5wW5hPQwUmyzC1fEcbE9mHX87lUGa3ETUtzbOsARzb1u+28QYrcyQWWpqL+rR2loV0jS0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPSUE2QCxTHbPuJ+qgdmRtnQY8qYEQITPagFMXUYoTk=;
 b=rvQYZ/bPIFMhOmfLNcHTRdzIR0lYJ9jrgvlpHCdZfwKciSN30lyOZdu3SIdoeE3jZwYB9VjQY8AOxFZkHmEwBsIYToLW/I3ezqgX8TT2HdHLnYI5gjDEy0f8qaFES0SdwtAh44tew1XOKrMkpq81IGmM4uuSbOer4YulV0VhnyA=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3771.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 03:01:19 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 03:01:19 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
Thread-Topic: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
Thread-Index: AQHVyfUbuOCcXK3SL0+leoduf4Kwfafo4l+AgACWwBA=
Date: Tue, 14 Jan 2020 03:01:19 +0000
Message-ID: <DM6PR12MB4137E0B1BE39D7C4DD1AC33CFC340@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200113093649.11755-1-Wayne.Lin@amd.com>
 <7e60f25010669799afe5bf77c943244809c744bf.camel@redhat.com>
In-Reply-To: <7e60f25010669799afe5bf77c943244809c744bf.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-14T02:58:48Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=38e5deb2-60ad-447d-b9b5-0000c9f0b509;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-14T03:01:14Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: bc24522e-3eaf-4ca2-918a-0000829c8e32
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6fa2b6d9-2279-4c3d-e0fc-08d7989e076a
x-ms-traffictypediagnostic: DM6PR12MB3771:|DM6PR12MB3771:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB377194A95AA89051A392DDF2FC340@DM6PR12MB3771.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(189003)(26005)(33656002)(7696005)(478600001)(186003)(4326008)(86362001)(81166006)(55016002)(9686003)(54906003)(8676002)(81156014)(6506007)(53546011)(110136005)(2906002)(8936002)(66476007)(66446008)(66946007)(66556008)(316002)(52536014)(71200400001)(76116006)(64756008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3771;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8+hXmQykzL1+XbU0BkGCJLqaPP8gNdXo/DiRPrHtpx4UHq0tRFb8GgErURu/FJ495qD/mFYNNkMtjXX9QYemBewiS7kmcKECDYLpMqeSMpi77umOvBDXu/9pRHHBCBCJNszw3iRyz000+fyzP0uLIoZdLYsYfGhMWgRUGmkzrXWN7o8EyPmJe9utRRhYtx58Ddsg4qKZsEwT95hcTVf7rQPL5bu8cda8yEi8TEU98bAh69Jg+7OnLvdrBSHoeJI8+6ou6yCQQwL9kMPLFmPLCyez04t9zWXf0QByiNbke4EM90LmJBja3s1noJ/vWxB9cp3N5SGZU3BnlWp3mgs5NO2ZG34QJT/Led4CrhQbjanYGReRu3MnExjiqmdWS0CuRSFK0nlmNtOlbV1yPcOg/tsDEhM5HexTb32/UYrVuwkaugiS7VrlpeBv/YB7n5P+
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa2b6d9-2279-4c3d-e0fc-08d7989e076a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 03:01:19.2047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LlUBlZoxsCrkGXUfAcnNIyAkIwqiI5BwT8uPWOrDzPLQYB9g6aoyeWw2wqxb6F0V01RVYuMxihLeHS/usmxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3771
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

Thanks for your time and hope you get well soon!

-----Original Message-----
From: Lyude Paul <lyude@redhat.com> 
Sent: Tuesday, January 14, 2020 1:59 AM
To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
Subject: Re: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time

Hey! Haven't taken a look at this patch yet but just wanted to let you know I'm going to try to get to most of the stuff you've got pending for me. I came down with a really nasty cold last week so sorry if you've had any other patches waiting until now!

On Mon, 2020-01-13 at 17:36 +0800, Wayne Lin wrote:
> [Why]
> Noticed this while testing MST with the 4 ports MST hub from 
> StarTech.com. Sometimes can't light up monitors normally and get the 
> error message as 'sideband msg build failed'.
> 
> Look into aux transactions, found out that source sometimes will send 
> out another down request before receiving the down reply of the 
> previous down request. On the other hand, in drm_dp_get_one_sb_msg(), 
> current code doesn't handle the interleaved replies case. Hence, 
> source can't build up message completely and can't light up monitors.
> 
> [How]
> For good compatibility, enforce source to send out one down request at 
> a time. Add a flag, is_waiting_for_dwn_reply, to determine if the 
> source can send out a down request immediately or not.
> 
> - Check the flag before calling process_single_down_tx_qlock to send 
> out a msg
> - Set the flag when successfully send out a down request
> - Clear the flag when successfully build up a down reply
> - Clear the flag when find erros during sending out a down request
> - Clear the flag when find errors during building up a down reply
> - Clear the flag when timeout occurs during waiting for a down reply
> - Use drm_dp_mst_kick_tx() to try to send another down request in 
> queue at the end of drm_dp_mst_wait_tx_reply() (attempt to send out 
> messages in queue when errors occur)
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
>  include/drm/drm_dp_mst_helper.h       |  6 ++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 4395d5cc0645..3542af15387a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1195,6 +1195,8 @@ static int drm_dp_mst_wait_tx_reply(struct 
> drm_dp_mst_branch *mstb,
>  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
>  			mstb->tx_slots[txmsg->seqno] = NULL;
>  		}
> +		mgr->is_waiting_for_dwn_reply = false;
> +
>  	}
>  out:
>  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) { @@ 
> -1204,6 +1206,7 @@ static int drm_dp_mst_wait_tx_reply(struct 
> drm_dp_mst_branch *mstb,
>  	}
>  	mutex_unlock(&mgr->qlock);
>  
> +	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
>  
> @@ -2770,9 +2773,11 @@ static void process_single_down_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr)
>  	ret = process_single_tx_qlock(mgr, txmsg, false);
>  	if (ret == 1) {
>  		/* txmsg is sent it should be in the slots now */
> +		mgr->is_waiting_for_dwn_reply = true;
>  		list_del(&txmsg->next);
>  	} else if (ret) {
>  		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> +		mgr->is_waiting_for_dwn_reply = false;
>  		list_del(&txmsg->next);
>  		if (txmsg->seqno != -1)
>  			txmsg->dst->tx_slots[txmsg->seqno] = NULL; @@ -2812,7 +2817,8 @@ 
> static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
>  
> -	if (list_is_singular(&mgr->tx_msg_downq))
> +	if (list_is_singular(&mgr->tx_msg_downq) &&
> +	    !mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> @@ -3743,6 +3749,7 @@ static int drm_dp_mst_handle_down_rep(struct 
> drm_dp_mst_topology_mgr *mgr)
>  	mutex_lock(&mgr->qlock);
>  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
>  	mstb->tx_slots[slot] = NULL;
> +	mgr->is_waiting_for_dwn_reply = false;
>  	mutex_unlock(&mgr->qlock);
>  
>  	wake_up_all(&mgr->tx_waitq);
> @@ -3752,6 +3759,9 @@ static int drm_dp_mst_handle_down_rep(struct 
> drm_dp_mst_topology_mgr *mgr)
>  no_msg:
>  	drm_dp_mst_topology_put_mstb(mstb);
>  clear_down_rep_recv:
> +	mutex_lock(&mgr->qlock);
> +	mgr->is_waiting_for_dwn_reply = false;
> +	mutex_unlock(&mgr->qlock);
>  	memset(&mgr->down_rep_recv, 0, sizeof(struct 
> drm_dp_sideband_msg_rx));
>  
>  	return 0;
> @@ -4591,7 +4601,7 @@ static void drm_dp_tx_work(struct work_struct *work)
>  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct 
> drm_dp_mst_topology_mgr, tx_work);
>  
>  	mutex_lock(&mgr->qlock);
> -	if (!list_empty(&mgr->tx_msg_downq))
> +	if (!list_empty(&mgr->tx_msg_downq) && 
> +!mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> diff --git a/include/drm/drm_dp_mst_helper.h 
> b/include/drm/drm_dp_mst_helper.h index 942575de86a0..d0b45468135a 
> 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -610,6 +610,12 @@ struct drm_dp_mst_topology_mgr {
>  	 * &drm_dp_sideband_msg_tx.state once they are queued
>  	 */
>  	struct mutex qlock;
> +
> +	/**
> +	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> reply
> +	 */
> +	bool is_waiting_for_dwn_reply;
> +
>  	/**
>  	 * @tx_msg_downq: List of pending down replies.
>  	 */
> --
> Cheers,
>	Lyude Paul
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
