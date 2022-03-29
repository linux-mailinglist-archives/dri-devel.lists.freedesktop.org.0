Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F34EAE51
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 15:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED410E94D;
	Tue, 29 Mar 2022 13:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE4910E94D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 13:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cchEXwobeG3QnQzYMEgX/J0A99yhO7TIiVfJl9EFBVMqaE0wxIAFMaObRBZ81ndYeK+zd+ukqKX7RZzybCjGWBmjCYt7LiNCHWRPkTC/VqQEyYJegPPavzk1lncnciRsNsSwo+2dMeepPdRwbJyb4N+560zhoAKxNtqWZ5XE801/h++aGMUKBYuwwzXrRJI1WXqumMWVgw7WWMQbcyP9BDEXV9bZNfXZmXFQek29LZvu656xtVeX4QbYIT7R/CmACflWdVEKA/vtlzCBHqvPd6XLLAvOfSEqorASmRtwFBaCmQEPzbdTAGLX/nI2v0HineF1XkJGJJysNar8nilreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIAH82Ew3t0h7L9AM6z63TviSP1khs6XcwSirTg/LO4=;
 b=OFRe0YxixBj3GBblCoKg1TrBA/AJJfdV5JS0qr+4H+rEHZ7Nh8zXX6+ANipZ+9hKIcZm1o3m3cBsh/qXEkd/bhSl6MleB56aVzgw3A+e1pllPaDIbI3JbORkKaOHvA3c46eaga5YPN+Sh7g6PU5LzPERwPtibjnOM3eT23uTxAE6QA9lRyzpWSwlzXofCrg+yJub35SCgi5vPu1KM4lGvV8gUBV++m7Nr5tQSKi7c4yiRQ8FOnUpZNAzc1+h5CZDhvdL2thMqClSzaIO/We0/6ermvuDgd7sBU96TF4MwZ/vaAZy6ms/eOQydKT8zftxcwCdTJtPiQFrtmoDQ2O/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIAH82Ew3t0h7L9AM6z63TviSP1khs6XcwSirTg/LO4=;
 b=vUCEpnIIjLTGBB7fFn9b+3ZNSLRBhpejYLCYOsOxahpjbeDr34+Pwt2Ml6tAD1bGo2BmUt7nDjCefDc2AyeeFNLofEfaJUknACWPCw7kUz0nEh35MxdwpdqNxEJ/0YZxHDD3vT86a6nueVJ2wx4PCtnqBAu7+HX6oeUkfEU/nvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 13:21:25 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:21:25 +0000
Message-ID: <55b9696a-8284-df81-7fd7-1fd4738a30e4@amd.com>
Date: Tue, 29 Mar 2022 09:21:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
Content-Language: en-US
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
References: <20220329080526.1583458-1-Wayne.Lin@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220329080526.1583458-1-Wayne.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5f91f2-632a-4fe2-d93b-08da1187064a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4009:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB40090E2E5E038C68F45F628D8C1E9@DM6PR12MB4009.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rB7LMb9g4U7PtSphjqG9Uw8KxrnT01ho/ybaWzcT93EBYVEl1f3FOHgeNRfYh/w8oAhRyeFFBaapSxIN2N+/y1ih/sTsG5gsdd3bithF/2r4uoRI5S6Pha9hE32JucEks0sBQUD02ghGRJq5TMPUzTkP5dvPTfYPhCWRJXD3f4yDgSMvJThhCiJbUY+qXI18Spg/lAhKn7LTUh8Oqhfk6D9420AE0wrBMeazHG3pyKgHt1VAl1upNJpNpeviFeWdcFP1vBtb5S7F6y4k1dNj7IPFD0WlI4fAX32l7trfxZSj/lrbvAcz9voh9xF9UKHoxlt3+twr/EV13DqQKJYRfDRwkg37QqYXWtxexgY+hUyON3KFiP8kjwRxIRoHHDQGS4D+yp9FJ1Pg5wkT0I4kjIfe7cK60b2PDhTiC6/1c4LvorpG8pxVr5OBvQomdizksPDnh+b4RUvY8eCzn6T/7YcJg6wZBmqnEFT/NVf1liDovAyW0kOZIhQ04MM7LvaKlvTgxquhyf4SjI49PSlgfPSKVztqYPzT3OWAatzu6v49jzF/7Z5NpEFrKLVAMTyIfW5LUDxZ/e4nUPHv+ChzIBazfCcTO5RQUrZIG0I38n8TSov2Dfvps7EOtIAuENvHd+HSu3zP9UHx6uwp7+tk+limP+vSbgWLAI459bkRkGFH8/nreqwyPYZowqNjqkiVrNQM6NnDXSpUOHCA8GAJRNfGwl9yG64BM41RYDdNoF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(508600001)(83380400001)(86362001)(36756003)(4326008)(6486002)(316002)(26005)(186003)(44832011)(31696002)(6512007)(8936002)(6506007)(66946007)(53546011)(6666004)(2906002)(31686004)(66476007)(8676002)(66556008)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2RIYnpYb1BRd0tOd0ExeDFCenJZdVhVYlFpY0QzN3g4MXF3VW16emI2SDVP?=
 =?utf-8?B?NkNsbEh2MnhXN1hic2ZVTHpHcVhIY3FpQXcwa0FCZjlxVjdZbXcvSGR2N3NR?=
 =?utf-8?B?d3ZYWnIwTkRjbWdROExxcmhLUm1FajhuQlJCVmZBZTJYbk8zVUEwVTdvMzAr?=
 =?utf-8?B?S0dORHNxQWU0VUJWZWl2a0RHajd0ZDk5clhUbm5EU0Y1S1pXKy9BR1BFdk1H?=
 =?utf-8?B?UjJ5WTNtYW13YW5iSnNtTWlnV2JMcHd6bnJyV2hqRjI5TFRmTUVXcXNldVVG?=
 =?utf-8?B?aVJDUndQUFJCd2txT0syeGJvUUZIa2lkWWZCeUpyR3hpaWlqSUJpZWRONG1o?=
 =?utf-8?B?dkFjaE9obGU2MkFYMlY5ajJhQnFjNmZodURkWUk3NG1UNis4eXp1NFFDMWlK?=
 =?utf-8?B?cU00bWYrc3RKV1VPN0lnZGFCNHBwMGZWRU5TWFMzZ0pheHlWUlliVnI1UHVN?=
 =?utf-8?B?R0VBbHNuMzNpaXBOUUswU1pwaVFSMUtTT04wcVJmSFd4OEVwRzA1R2o1SitQ?=
 =?utf-8?B?M0JyL2ZmVk1kelQ0ME56M0JSN0xQSC9pRzhiTDlsT3BlMkZhUU1oWTVYcllj?=
 =?utf-8?B?a0NFZ0cyaEVKZ1dMWTMyQldQdERkNUNza1BWTXVCcnJ6clBVTmMyWFk4OUww?=
 =?utf-8?B?Q0tOYW5RV21mUldiQVQ3Q1pheU5nanJacHJjUk5UYkJMcnFLOUowaC90MTRi?=
 =?utf-8?B?YXBQQmdzcEs4ZG9oMlVDUW10S2xXU1Z5cE5tQ1g1THIxSUo4cThDUHR2enJD?=
 =?utf-8?B?TG81OVpuc1VEbHBxN2x3YnZhYXFlZ1owSW5NdTZnREIrMXd2b2V3cUhwNmE2?=
 =?utf-8?B?WElVZm8xUHN1UE1kRnV6Ri9heVRHaHlIRDVIaWRySFgzKzFrUGZId0xtZEF5?=
 =?utf-8?B?Sm1nQW1KWlJxdElYWUVMQlhHcjlSdjVJQmpkM3ordE00RVhPY0Y0T2ZTRERB?=
 =?utf-8?B?ZEl1QTZUNDByTkRtTFJqWEhuZkZiUS81TlhFYWY4SHVCRjROY3VlaWc2QUVj?=
 =?utf-8?B?OW1CTTdKZVRTV0s0RnRValNkN3paSEZzblU5aytIS0VTeDhkOWJ0VVVYTThw?=
 =?utf-8?B?dE1BNGovVjZYQ1BsVzRDWnJhUEJkTTZkRmR1cllMNFRkSktta3hsb0lrd1BE?=
 =?utf-8?B?ZlN3TG9yWXdNMVFxU2V0ODArVVFQWmJrblJ3OGI0VVhtU3JQaXUvSUpINkZm?=
 =?utf-8?B?YkVTTXR2SVN3UHhOQktGR3h4YUxOdHlQT0xMTXkycjROa0U0bFo1Tzc1MFRI?=
 =?utf-8?B?YW8weFVzUitIaTQvK2JZN01BNm5Mc3J3ekkrRCt6Uzl3aER5U1Bkb1hOQVVT?=
 =?utf-8?B?RkV4L0VmbzlWOVY2cmttZHZUdFhwRDRBV1JNWVlsL0dMWFFRTHliWlIxQXd2?=
 =?utf-8?B?dklWUDNtMDVIZzRrZnIyVzFuMzJpdFV2eXJoVlhESGNDVXZ0UTQ3Qkpjejd1?=
 =?utf-8?B?ZVk5b09YVjFsVmxvNzM2YUhKa3ZUOHUvcTVZSjlxdXVKbGx5dDYvanI4MXdm?=
 =?utf-8?B?OUlWc0MyOTRBSkZGWWFacEVxR2YxSEE5YlFjbmpQU1M1S0RiVXVqcml4N0VU?=
 =?utf-8?B?N0QwWkFJUXM3YUh2czdhZ3FlTis3MmZUelVzbWlMd0xvcTMwdnp1WW5VVHUr?=
 =?utf-8?B?dDB6emoxNmIybmJvYmUyL1ZXNkhUcEUrbXJrbExUMUQ4bFQxYjZDMHVEYUdz?=
 =?utf-8?B?VC9rNWV5SnF1Qm45TTF2NHNTL0F1MDNlK3R6N0sraUFaSGZFQjZtZEY0MkM0?=
 =?utf-8?B?eDZrZXJDUjNNdnpQZkY4VzhXRjdscTVGdU1LTzRteXFlWXFPeEcydVBKWmNr?=
 =?utf-8?B?cEVBREF4N0tsYkU4YS9jNW1RM1ptQmdCcHc4b0tvRlFPanJtNkd4WWdyeWw4?=
 =?utf-8?B?R3FlVUdadkZpQnhGUDdkeURDQTBHbnkva3I0bm91TGNIL0h0TU1XQS8vZGQz?=
 =?utf-8?B?azJJRFo1QjNaczVXMTNjMmRVelNvdm9lQ3pnbFZQRGs4Ri8zMVk0U2J3a1FO?=
 =?utf-8?B?eE5uZXVBbGl2NmdNWk1Ob0RVcGxPOFR5UDBVU2FleHYwcVVLd2ZCdFg5MzhR?=
 =?utf-8?B?eXBQQnNPZnVEYVlmbE03eElVejFJRkpINjQ1VlZDdlZmOXRvT2hZWmYyemgz?=
 =?utf-8?B?MmVyUjRRQzB4MHpRUXMwT0xQU1Y5bStkVmczbTZUQkc2V0xSNHF4cllHZ2xP?=
 =?utf-8?B?Z2ZvWkdCNFVtbXR5V3dYQjJ1dEpkWE1haHp6bHNsT0xSNVR6U3JIV2ljaVNB?=
 =?utf-8?B?Vng3emd4K2NPR1lYQ3doNFg3SkJEYWxzN1ZQMzVHMU5qQVJxYTk5dERlQnhE?=
 =?utf-8?B?Q3JMOFZRd1ZwdE40dTN5ZW83d3B1cCtURnpCbmtyY2pRYkpxc3JaUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5f91f2-632a-4fe2-d93b-08da1187064a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:21:25.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3P/QIr02uzbekD37k3dU+iVJ607wNf9WlYyHGgfACFHeApW/31lvZHe13CnrxKT9mIsqD8MW0k1+midTzBmCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
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
Cc: jerry.zuo@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-29 04:05, Wayne Lin wrote:
> [Why]
> It's reasonable that we receive NAK while doing DP_REMOTE_DPCD_READ.
> Downstream device might reply NAK with the reason and source should
> react accordingly.
> 
> e.g.
> 1. When downstream device can't handle corresponding message in time,
> it then replies NAK as reason been set as DEFER.
> 2. When multi-function branch-sink device doesn't enumerate virtual
> DP peer devices for those multi-function down facing ports. Without
> virtual DPCD, branch device might reply NAK with reason as BAD_PARAM
> indicating this port can't do aux DPCD read.
> 
> It's expected result. Not an error.
> 
> [How]
> Use drm_dbg_kms() to replace drm_err() when receive NAK.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/dp/drm_dp_mst_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> index 11300b53d24f..764a6b59bc1e 100644
> --- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> @@ -3557,9 +3557,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  	if (ret < 0)
>  		goto fail_free;
>  
> -	/* DPCD read should never be NACKed */
>  	if (txmsg->reply.reply_type == 1) {
> -		drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
> +		drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
>  			mstb, port->port_num, offset, size);
>  		ret = -EIO;
>  		goto fail_free;

