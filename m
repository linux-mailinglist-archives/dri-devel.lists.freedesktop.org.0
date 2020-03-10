Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F91801F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 16:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279389D77;
	Tue, 10 Mar 2020 15:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8E889D77
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI5Mj/4iwzvqOqFBP7bWuNDt6CxfRr/E2dAON9DZVE2dAua/QEguWU/Ir/sVDplAGzg++L8aAxjB/clRw35zZDn4djSeCut6A1TdldQnbyeE+5N8wh/piSI7zujrU3u0+Y+E9jeZgfIqkvArqPzuLXLzkUMNhfjvr+4EoQOYqqn+vOE6Ux9bcmVfnCZvIb1zUEi8miTc4MKBrmXwk4L40SLDg3bxj8qiTCO1wn0mILGPhS7Ap1qp1p6ZjMtZnUgwWQMy5LOwEbgaf2NaAzOjXCcXlvOI0Im92OVmUTHyxrzcC4fpItG2irIVrIDuk6oF11U9TvywmGg8Uhg3KK2zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhBQhPejRKg9huVBsDwInAaBYpFIw//kUcE4VzfzQpQ=;
 b=auJoBIqDdEEmSgVhjdCiPobnU5ShypkwEonbFnXkp222NHs8JboG8Kl873YyZTxwE2IWG/io8c5RmltSOW7I2sQ9H0WULni05xBwHhgX0POy+vAlHheJIJJV0ZpLKbu8gX1n5BDVDpWOHZ97lKC5ceuG+UPDRGZ770g5fc1WdCMKQTcZJXnlERPnqLbGnS6ItvSPVAXgnyz3BAkLRFCk8tz1eDKseVxL2mpxOMQ9vFEY9eN6+n7NUeuNw/v/vssdN7Bc1cukIlJeN7zeVmJ6RWgGv3qgszawGp1ATHtBXifx/WSwja9CRyW8dWmSF12KSDMme4IU+cgO4GXd0+qW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhBQhPejRKg9huVBsDwInAaBYpFIw//kUcE4VzfzQpQ=;
 b=EgQ3rQ9mouT6Bx1px/T5Jr9FhJHBOLVcHLc+nNj4/oKcyE2J2YV1r5t0PSQsvKDIH2kLPGRgVi6k5yLC8kYFsERtrxWO1Y3AO7sazdDtPV14PeAg2KnlxSuiMk0j4aD5bDf0juqS1ZTgkqC2aoN+TxXTRGxxxIz11IBFhSQixQQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from DM6PR12MB2906.namprd12.prod.outlook.com (2603:10b6:5:15f::20)
 by DM6PR12MB4529.namprd12.prod.outlook.com (2603:10b6:5:2ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Tue, 10 Mar
 2020 15:35:43 +0000
Received: from DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::cd57:c685:c45c:8c07]) by DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::cd57:c685:c45c:8c07%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 15:35:43 +0000
Subject: Re: [PATCH v2 2/4] drm/dp_mst: Use full_pbn instead of available_pbn
 for bandwidth checks
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200306234623.547525-1-lyude@redhat.com>
 <20200306234623.547525-3-lyude@redhat.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <143de1a1-c59f-6ff0-501c-1467872bc9d9@amd.com>
Date: Tue, 10 Mar 2020 11:35:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200306234623.547525-3-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To DM6PR12MB2906.namprd12.prod.outlook.com
 (2603:10b6:5:15f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.224.72] (165.204.55.250) by
 YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14 via Frontend Transport; Tue, 10 Mar 2020 15:35:42 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90595b80-85b3-4072-32e4-08d7c508b1bd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4529:|DM6PR12MB4529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4529CA854B2A9CDC065D1151E4FF0@DM6PR12MB4529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(52116002)(36916002)(26005)(8936002)(8676002)(4326008)(81156014)(81166006)(66946007)(478600001)(54906003)(316002)(31686004)(2906002)(16576012)(5660300002)(36756003)(6486002)(7416002)(186003)(16526019)(31696002)(53546011)(956004)(2616005)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4529;
 H:DM6PR12MB2906.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sxowzDOCFJsi4+Cfjt6zZT1cwhlmNdFhV2bZMrd7LfNI7wud/CxkESBCZKmsCLTtSOziV0QgtN30gyvpu2e9/pvY7nSCDUo5T+iW6zdpox5120XdohAJU0TkW20u93rY67rDYpRY6V/ECC3OFTC51de2mZ5XmJg5b06TjIv5khPdtD3ikfl3W12Ps1Xmt1B27TIvRa0/fFnXq9Ly4Zphox64FINL9aXjdJ3m4KqgNduqBCCTbtru05an4CVEmf/+z9faxG1R6sjVGy+Pw7lftlKJgmcqPLIx2tioQiyf8GK78osGTrqJb1BigYe9bxhUCG0xd4sLkieAUR/vvtLG1AJjQY41TF6onJUXDsFB2PlcHed+2stff4AxhBFOKIOZ9AglzjL12Wa0NyjeVQWuVV/BaKS+NoyJORPXeqnLse32/RGzJ6UJwFSULQzjKsi
X-MS-Exchange-AntiSpam-MessageData: qmUhpKvrzwov1wjr4PZZWBoSAJhXVlQzxlce8WcZ8fX0csQiYUDL15DoMjWbPvkzkhdsC4G9QSsP9M6hmTQIFRNBZFescYkj5dvato1ps86oEG7mptVaa/S5p4DaN7qdhdIpc4aMcaiGWDQaWTKcug==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90595b80-85b3-4072-32e4-08d7c508b1bd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 15:35:42.9700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aknlMQ9YOglkFiIAkQIw4SRL5k/QAxA9ZS6uUNUZhpYn8poLzOU/MV/Psk6GiLMt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4529
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
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/6/20 6:46 PM, Lyude Paul wrote:
> DisplayPort specifications are fun. For a while, it's been really
> unclear to us what available_pbn actually does. There's a somewhat vague
> explanation in the DisplayPort spec (starting from 1.2) that partially
> explains it:
> 
>    The minimum payload bandwidth number supported by the path. Each node
>    updates this number with its available payload bandwidth number if its
>    payload bandwidth number is less than that in the Message Transaction
>    reply.
> 
> So, it sounds like available_pbn represents the smallest link rate in
> use between the source and the branch device. Cool, so full_pbn is just
> the highest possible PBN that the branch device supports right?
> 
> Well, we assumed that for quite a while until Sean Paul noticed that on
> some MST hubs, available_pbn will actually get set to 0 whenever there's
> any active payloads on the respective branch device. This caused quite a
> bit of confusion since clearing the payload ID table would end up fixing
> the available_pbn value.
> 
> So, we just went with that until commit cd82d82cbc04 ("drm/dp_mst: Add
> branch bandwidth validation to MST atomic check") started breaking
> people's setups due to us getting erroneous available_pbn values. So, we
> did some more digging and got confused until we finally looked at the
> definition for full_pbn:
> 
>    The bandwidth of the link at the trained link rate and lane count
>    between the DP Source device and the DP Sink device with no time slots
>    allocated to VC Payloads, represented as a Payload Bandwidth Number. As
>    with the Available_Payload_Bandwidth_Number, this number is determined
>    by the link with the lowest lane count and link rate.
> 
> That's what we get for not reading specs closely enough, hehe. So, since
> full_pbn is definitely what we want for doing bandwidth restriction
> checks - let's start using that instead and ignore available_pbn
> entirely.
> 


Thank you for the fix and a very detailed explanation.
I was really confused by available_pbn and why it wouldn't get updated 
and was searching for the solution in wrong places. But I'm glad you 
were able to identify the solution.
I still think the port should have an available_pbn value so it could be 
updated when driver parses RESOURCE_STATUS_NOTIFY and 
ENUM_PATH_RESOURCES messages.
With that being said it is a great find. Thanks.

Reviewed-by: Mikita Lipski <mikita.lipski@amd.com>

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>   drivers/gpu/drm/drm_dp_mst_topology.c | 15 +++++++--------
>   include/drm/drm_dp_mst_helper.h       |  4 ++--
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 6714d8a5c558..79ebb871230b 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2306,7 +2306,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
>   								port);
>   			}
>   		} else {
> -			port->available_pbn = 0;
> +			port->full_pbn = 0;
>   		}
>   	}
>   
> @@ -2401,7 +2401,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
>   		if (port->ddps) {
>   			dowork = true;
>   		} else {
> -			port->available_pbn = 0;
> +			port->full_pbn = 0;
>   		}
>   	}
>   
> @@ -2553,7 +2553,7 @@ static int drm_dp_check_and_send_link_address(struct drm_dp_mst_topology_mgr *mg
>   		if (port->input || !port->ddps)
>   			continue;
>   
> -		if (!port->available_pbn) {
> +		if (!port->full_pbn) {
>   			drm_modeset_lock(&mgr->base.lock, NULL);
>   			drm_dp_send_enum_path_resources(mgr, mstb, port);
>   			drm_modeset_unlock(&mgr->base.lock);
> @@ -2999,8 +2999,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
>   				      path_res->port_number,
>   				      path_res->full_payload_bw_number,
>   				      path_res->avail_payload_bw_number);
> -			port->available_pbn =
> -				path_res->avail_payload_bw_number;
> +			port->full_pbn = path_res->full_payload_bw_number;
>   			port->fec_capable = path_res->fec_capable;
>   		}
>   	}
> @@ -3585,7 +3584,7 @@ drm_dp_mst_topology_mgr_invalidate_mstb(struct drm_dp_mst_branch *mstb)
>   
>   	list_for_each_entry(port, &mstb->ports, next) {
>   		/* The PBN for each port will also need to be re-probed */
> -		port->available_pbn = 0;
> +		port->full_pbn = 0;
>   
>   		if (port->mstb)
>   			drm_dp_mst_topology_mgr_invalidate_mstb(port->mstb);
> @@ -4853,8 +4852,8 @@ int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
>   			if (drm_dp_mst_atomic_check_bw_limit(port->mstb, mst_state))
>   				return -ENOSPC;
>   
> -		if (port->available_pbn > 0)
> -			pbn_limit = port->available_pbn;
> +		if (port->full_pbn > 0)
> +			pbn_limit = port->full_pbn;
>   	}
>   	DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch has %d PBN available\n",
>   			 branch, pbn_limit);
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 5483f888712a..1d4c996cb92d 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -81,7 +81,7 @@ struct drm_dp_vcpi {
>    * &drm_dp_mst_topology_mgr.base.lock.
>    * @num_sdp_stream_sinks: Number of stream sinks. Protected by
>    * &drm_dp_mst_topology_mgr.base.lock.
> - * @available_pbn: Available bandwidth for this port. Protected by
> + * @full_pbn: Max possible bandwidth for this port. Protected by
>    * &drm_dp_mst_topology_mgr.base.lock.
>    * @next: link to next port on this branch device
>    * @aux: i2c aux transport to talk to device connected to this port, protected
> @@ -126,7 +126,7 @@ struct drm_dp_mst_port {
>   	u8 dpcd_rev;
>   	u8 num_sdp_streams;
>   	u8 num_sdp_stream_sinks;
> -	uint16_t available_pbn;
> +	uint16_t full_pbn;
>   	struct list_head next;
>   	/**
>   	 * @mstb: the branch device connected to this port, if there is one.
> 

-- 
Thanks,
Mikita Lipski
Software Engineer 2, AMD
mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
