Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DE1B62BD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 19:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01276E0AF;
	Thu, 23 Apr 2020 17:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A796E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVfS68aHm7SJqFeLcGgeLbXJz3kfMP6W7C3XRkvLdSXuOuSkjBU4NNsUhqjEm5dYv0dNxYIwaqYRKy0zgoUZivL13+3JnBJfX4bkLRJHs0kBHgjLbuV2V+whFkpIH+arjLjf+U4rQjE/Q5NESLEetOPoiaTeqot7UkG81NJ+cpOHM6v9yoYAfu8cm3ACve2CWkpozMjlkkvtdXuA5N7MEW7flaPm1BTbxh6xZgzL9v+ipX3qpMic2lWF8aOElYkl3f8oJLJFh3e3+Gk3eLD3zTZM/44p+JktYnhjDVVXNLUAJO3SUelerDvJvyTpGpEoMvgz3NmLzjlpS3AiIhEjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZdj1t5S9T2iAq3wN370czQ2Whu2b2xisKJwTmUez2U=;
 b=l/6gwiK+Ge4t7pLmC13pKgaLvlhkHnQAzvAmKWSvNTJdCyasoJjx/f2Z5VPGnliwGl6lSyumiAWBeXWQoAPfQ7ZSrD+Y2KYqBThnQk8RkVC+T+KhsJtyueVs/yef0u5f1uHgU1aX4Gn+794qf0b+Wf2Zk0elctVfAeM6txyEi5LWglWULzc1zF/hXZduxPVfSKNWU6iO/OQzuvKfp9JQ22+/V5SM0vjcHNqs22Oo8Gc3Y/AdWV4aofXyGh58tng8LGy8ialNlcs8yagCkV5B+tUHFGllu78Ouh1lZoBLmktWISNu+tPe9htW3IE9cPiVy6doSefwVN7/S+SXE1mktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZdj1t5S9T2iAq3wN370czQ2Whu2b2xisKJwTmUez2U=;
 b=OBXDrO2Q8yinjrTRYgt3/b3dYpWSkKC+0BZnek5FSm6XuNnSnrbeTrlw5s42V3Vj20Mo1aEPGq827AtFBQlPrUQxF4MAXYPbihC4uDNmr2pmg0Olh6ldw2/LBxzhKNL1+x24KHHSLg6rZ4JVr4i2lSIEpk3ytIuevhjPWFH+vmQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 23 Apr
 2020 17:53:30 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 17:53:30 +0000
Subject: Re: [PATCH] Revert "drm/dp_mst: Remove single tx msg restriction."
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200423164225.680178-1-lyude@redhat.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <8fd4b3b0-388e-9856-4bfb-5d0bb36c257d@amd.com>
Date: Thu, 23 Apr 2020 13:53:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200423164225.680178-1-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::46)
 To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::2] (2607:fea8:9240:c66::2) by
 YT1PR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 17:53:29 +0000
X-Originating-IP: [2607:fea8:9240:c66::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78b8a982-fdde-4990-263c-08d7e7af3ba5
X-MS-TrafficTypeDiagnostic: MW3PR12MB4428:|MW3PR12MB4428:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB44285A440368268BCC2B751C8CD30@MW3PR12MB4428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(8936002)(36756003)(31696002)(186003)(16526019)(2906002)(2616005)(52116002)(5660300002)(8676002)(31686004)(316002)(478600001)(4326008)(6486002)(81156014)(66556008)(66476007)(66946007)(53546011)(54906003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdYE47+fSfjWQ57Abdn8A9JihI2uGBIxW1RjtmbZtpQ4ElaDpvj5kNYvNMhiWwiVqrjY/lTjlX6iyQcwJzTzofw9CzYM/r2GrPuo2WvUVu12g5fvHsBBithFV6HVz7OEVe4dOt4/R3TtnYopWUglCPEbEbe9pPkQCCOTL2wtaPXFrYy+QRiD0mKRpXThjiBpxIAp+crVhmQm3BkWsMXEcbmrrbvd8+q1zybQgdss4s7/T5/hRGyJ9S/QsCADN7BQiYH8BXpHV1wLf71LuHB0f2jJ79ohdnM8XX1cRe/Tp9J7cGdZGSh6P6crEIFCFS7AQaQrXEs6HyOqiXuXtcXy89aNEaks+yR8pd42jg1IoK5oTs3hVirqL1IsGT2uwzV/akysetlJaDMuDZsrGEUAcO2ONMubXd7TsT78NuMaxiiEXVqfcxJJsSYUY1Zy0s0W
X-MS-Exchange-AntiSpam-MessageData: +PhCyHp3ofoxyVZVhkMv3lMe1QLcmjZUdUZmLzd2d0XxLK/cETYMVs5q745L0u5O2SG1Q/Xxuj75M7VB3rsK22B752u1qgFmjxVB6kqDK2iaVeuOKil3cOZ2zpLvKU+c4Y4i68fsE1vZ3p4cFHl/PgIi2E0HOsr69xwCIGg+mGA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b8a982-fdde-4990-263c-08d7e7af3ba5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 17:53:30.4815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eH8JtpXrx+wtTV6ZlbSnNRetF8xpVNoZhQDDf1r6vEXSSgLLLT+jZ929Z6svt9a9Y4VOI2KkHB5oISYVmfVVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Wayne Lin <waynelin@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-23 12:42 p.m., Lyude Paul wrote:
> This reverts commit 6bb0942e8f46863a745489cce27efe5be2a3885e.
> 
> Unfortunately it would appear that the rumors we've heard of sideband
> message interleaving not being very well supported are true. On the
> Lenovo ThinkPad Thunderbolt 3 dock that I have, interleaved messages
> appear to just get dropped:
> 
>   [drm:drm_dp_mst_wait_tx_reply [drm_kms_helper]] timedout msg send
>   00000000571ddfd0 2 1
>   [dp_mst] txmsg cur_offset=2 cur_len=2 seqno=1 state=SENT path_msg=1 dst=00
>   [dp_mst] 	type=ENUM_PATH_RESOURCES contents:
>   [dp_mst] 		port=2
> 
> DP descriptor for this hub:
>   OUI 90-cc-24 dev-ID SYNA3  HW-rev 1.0 SW-rev 3.12 quirks 0x0008
> 
> It would seem like as well that this is a somewhat well known issue in
> the field. From section 5.4.2 of the DisplayPort 2.0 specification:
> 
>   There are MST Sink/Branch devices in the field that do not handle
>   interleaved message transactions.
> 
>   To facilitate message transaction handling by downstream devices, an
>   MST Source device shall generate message transactions in an atomic
>   manner (i.e., the MST Source device shall not concurrently interleave
>   multiple message transactions). Therefore, an MST Source device shall
>   clear the Message_Sequence_No value in the Sideband_MSG_Header to 0.
> 
>   MST Source devices that support field policy updates by way of
>   software should update the policy to forego the generation of
>   interleaved message transactions.
> 
> This is a bit disappointing, as features like HDCP require that we send
> a sideband request every ~2 seconds for each active stream. However,
> there isn't really anything in the specification that allows us to
> accurately probe for interleaved messages.
> 
> If it ends up being that we -really- need this in the future, we might
> be able to whitelist hubs where interleaving is known to work-or maybe
> try some sort of heuristics. But for now, let's just play it safe and
> not use it.
> 

Sounds like the DP spec would need an addition bit to indicate actual
support of interleaved messages by the RX.

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 6bb0942e8f46 ("drm/dp_mst: Remove single tx msg restriction.")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
>  include/drm/drm_dp_mst_helper.h       |  5 +++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 21f10ceb3d6c..03a1496f6120 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1205,6 +1205,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
>  		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
>  			mstb->tx_slots[txmsg->seqno] = NULL;
>  		}
> +		mgr->is_waiting_for_dwn_reply = false;
> +
>  	}
>  out:
>  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> @@ -1214,6 +1216,7 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
>  	}
>  	mutex_unlock(&mgr->qlock);
>  
> +	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
>  
> @@ -2789,9 +2792,11 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
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
>  			txmsg->dst->tx_slots[txmsg->seqno] = NULL;
> @@ -2831,7 +2836,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
>  
> -	if (list_is_singular(&mgr->tx_msg_downq))
> +	if (list_is_singular(&mgr->tx_msg_downq) &&
> +	    !mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> @@ -3823,6 +3829,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
>  	mutex_lock(&mgr->qlock);
>  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
>  	mstb->tx_slots[seqno] = NULL;
> +	mgr->is_waiting_for_dwn_reply = false;
>  	mutex_unlock(&mgr->qlock);
>  
>  	wake_up_all(&mgr->tx_waitq);
> @@ -3830,6 +3837,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
>  	return 0;
>  
>  out_clear_reply:
> +	mutex_lock(&mgr->qlock);
> +	mgr->is_waiting_for_dwn_reply = false;
> +	mutex_unlock(&mgr->qlock);
>  	if (msg)
>  		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
>  out:
> @@ -4683,7 +4693,7 @@ static void drm_dp_tx_work(struct work_struct *work)
>  	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct drm_dp_mst_topology_mgr, tx_work);
>  
>  	mutex_lock(&mgr->qlock);
> -	if (!list_empty(&mgr->tx_msg_downq))
> +	if (!list_empty(&mgr->tx_msg_downq) && !mgr->is_waiting_for_dwn_reply)
>  		process_single_down_tx_qlock(mgr);
>  	mutex_unlock(&mgr->qlock);
>  }
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 2d7c26592c05..96bcf33c03d3 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -592,6 +592,11 @@ struct drm_dp_mst_topology_mgr {
>  	 */
>  	bool payload_id_table_cleared : 1;
>  
> +	/**
> +	 * @is_waiting_for_dwn_reply: whether we're waiting for a down reply.
> +	 */
> +	bool is_waiting_for_dwn_reply : 1;
> +
>  	/**
>  	 * @mst_primary: Pointer to the primary/first branch device.
>  	 */
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
