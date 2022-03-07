Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85E4CEFA6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 03:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3110E0A9;
	Mon,  7 Mar 2022 02:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40067.outbound.protection.outlook.com [40.107.4.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A7110E0A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 02:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRYBzs3+IviMIxMJCQccojJCCHOcu/EWT3plkRT8OBY0F2WxbSD8xn37ZBrQe7kxdSlKkR3tRVXG+FAxkKIH06/MpmpCdISBZe0PymFiFZATNVejL73HVieDmYdjRNjZ1nBK5vYNiM4g3zGBz6Jzk+O92DZoo5fbslLsllUNprLQ9FrlGgGJOq2OYzyq2fb4t7YI+96UiW2tL82hKPl7I9v9XUNMni6n339WtjoW+/NxacBVheWcGFDxner5kG6x5a0jLtz7HDRmgaz7fNyh8nb1Y8Yk4npRpz0tC64K7zc7faxh7mr7EDHY6LVaN1jdLWh36D0QQLrWHtH3KTP1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y26M5nx/fY+YMNAHRfqQZm1EZfr/r1P+2DPFObWjD/s=;
 b=gjvVp5GvH2NcZhzc1f5iHDLulNRyVuFWr7bmxN/T+EkIwiZ04k42U6jcoQkZAOQY5/ohNgVfkY/JPV0ivupT6+/g+36Z/GPYE6Tu6+ZX5/pc452Fs0B/v5GhlOHhOGOSxVTHtE0qQttqZDxvYtRgAhP71fVkItf3NgvmQf+SV5YOhDmW2XAGZjrL+xohYjsxuq/DLqK7/WhWW//4zjIQZHvuB9i7LIV7hw5no+xlTaVeQVhFHhbFA2Wio5u0KizT3YWI5dwF42T2lmVMc6hYtOYjn5U3jVYJX5iCYvaG7nqT//IMdsVDptu6rG5UWhlS+O5vhPXRjP/8REUgayl1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y26M5nx/fY+YMNAHRfqQZm1EZfr/r1P+2DPFObWjD/s=;
 b=J2CMZjGAg4bVLniaUbzu39VhcGoCTFoaeRgZzzh8BDeXaxO4/VxkqgsztEByTu5+Y8lXdnclb48l4J3Z8S7UAUIe4jItNoqYQCXgFmFdCqLZi+pFmV3kh8R8qK2mKidlHuS2TTStIXuFb7qCMcQ44MUaclcwnQtjZcNYs6CnFQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM5PR0402MB2785.eurprd04.prod.outlook.com (2603:10a6:203:98::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Mon, 7 Mar
 2022 02:33:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6117:74ed:7550:b3b3%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 02:33:50 +0000
Message-ID: <9ac021dcf3c6a7a3dfa3d88dfcde18fac8a74243.camel@nxp.com>
Subject: Re: [PATCH RESEND] drm/self_refresh: Don't trigger the entry timer
 for self refresh work if CRTC state is inactive
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Mar 2022 10:33:41 +0800
In-Reply-To: <20220207054617.987811-1-victor.liu@nxp.com>
References: <20220207054617.987811-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b0c4ecf-74d7-4814-fc86-08d9ffe2e9ce
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2785:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2785930799CE54C729D66B0198089@AM5PR0402MB2785.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMJU45enmlp8gxAJn5y59Sh6H9GNqF7SViAHd17WRjfKCTMEPyXzVwfyfL+gWgoTsC00afcP+dqnwXjp7VcoivdVox+MWsu/f8aS95NQ2x1+L1NmhMSFlaBfLPtHIwdXRGDQXmbyoceqhTFRDsIoLvgoGl/RoFCn1EX76jHJ5ol2mtcyKnmPXKTvjxY/IZEel5w8vB4mr3bxoSN6jr0lxHZv81PTffRImDnl5YyC5roA+hD6Vad8yMqzcmJlHRIHXUgnT8wByeGAdnBOvyNLFG82d2z0/tafBvj2aBUIzAjJ6lDQM2cesm+0E1CiZPcblqxfdt0uL1RvSkGXcGat6G9gemu0KCEqvkkcGMkhdasu1XrmwVIRtK9q7s0bxk/8zJlcUhywQemeGOIOa9kako/FXFu9txq7ZQrGIerqv/qJrf1xfVFbvVXT3Wq+Wowxp6Lp8XcxBwdYwNEQaPmfAQ8EhUT1oSM5GqURl2TB781jD/k4IKcXfezk7suLStWWaIq2nTmqobxSQ/+CWHxbcSU43qWPZqb9e9zBod546fDoIfEbz2RaBmJSFSwoM9jbkzJz+q2TFxgvUXosTc9gqLeweyH8ocgtLwCP1gvjKMpr9c6Cb/sd/ssN8mNq3SISD5kzFyXWSypPxZU96ItfISSNE8NuRGScW1T9uxwEkKjX40808NssoLajiy1DUPadUKwnzB2t4c8Oa0z8wRxBSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(6486002)(36756003)(4326008)(8676002)(83380400001)(66946007)(8936002)(498600001)(54906003)(7416002)(6506007)(38100700002)(86362001)(186003)(6512007)(38350700002)(2616005)(26005)(2906002)(5660300002)(6666004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2l6bEZtMDJmL05LUUlsQ1ArTXVwOTJRRy9WSVJDeE9jMGRMQlNUQUFKdU1z?=
 =?utf-8?B?VDY5RzhZRVVxUFY1N3VJWkJ0dXUxcDg4ZlZvbmNJMkNBQ0ttQWhLazN1U1I3?=
 =?utf-8?B?WW1vUVRUeENFWHBETW5Qak9Oc2d4OUNITFQ2TUs5QnlncSt6c09hZFN5bkhq?=
 =?utf-8?B?bHMrU3JhOFgxTXdrRy9vWVBYZlBWMGsrZWd0eTF3TTBhSEdXM2UyRWlqQTRM?=
 =?utf-8?B?eG5mOVBZL0tCcTBEWmZRV2grUUZjMDVsdm4ybUhSdmlwcVZMZW5ZVVpkVVhD?=
 =?utf-8?B?YlZNdC9iemlvVFBVQVhMcHZyeVNSVnZlUW00VExQeHEzbmdXNktlbWxwbk5o?=
 =?utf-8?B?Y05EZmRsdnpseXpuU1lUNDhPbUJhK0NoRzNVVUU0TVpKRDlFNFdtSDZVYkhG?=
 =?utf-8?B?WStsa2VFM0djR05mZmc5bXZCSDNxTWtLdGU2SEI5ckFDcUpXY2haelAzaUdl?=
 =?utf-8?B?TXZCSkNvbXRacGpYenhTTVYzS21KUzA0eTh2YU1OZTdsZ0ZCR3E2WlF6VFhl?=
 =?utf-8?B?cmxIWThreXo0S3VVUDlZRTRqOFJCaW45Zm1DSkhhb2NBS3NNdnZucjI4a0FC?=
 =?utf-8?B?T25UbDFQR1hJNDVoSUFyb3cwRW5MS3JtYXM4TlVCNURESlU5NWlkVEZoQmJI?=
 =?utf-8?B?eDN5YVN1WHpIMGVvQjNKbXBMOFRIUTJoZ0w1WTZnUFVGUXpWUEZ4MDU2SWRh?=
 =?utf-8?B?TmpLdkI4VXlaZloyMEU5WDJMdmRwMU1hRko3Zk5wSjBpOTJYcHE5RFJPRDRS?=
 =?utf-8?B?TDlBY1ZMaVhTKzgwejI0ZWp1K3pjeEpTUWxQVnVyZnF6WVdQZWE3WEErQmVy?=
 =?utf-8?B?blpwOVpaSHFTWjJ0UVhtMTlXYWZJYzE5aXBxcTZuYUU1SElSd3Vmc2JoWWh2?=
 =?utf-8?B?UHR6ZklRanl5ZVFWZnJPSktyMlpwRDZFdStGWFNXb0lvQk1ZWERQV0tEaUk1?=
 =?utf-8?B?OUd2cXR3V1dXL2xFZWNYVmxPYXNTM1RnR0tzTEs5cUM0OVhmc0lWMHh0MUk1?=
 =?utf-8?B?VkNQdmZxNDVvcDRxUS83TVpqb052NElBM1ByemZyeEh5eXB4VWVVR3ZvbnNL?=
 =?utf-8?B?TUhranovOTdBM094SEo5V0V6R0VlVTVxUmpPZldyS0RsOVc3VnkzWDhiWjMv?=
 =?utf-8?B?QUJhblNnRGhWODQ3R1VMOXRMaTlHVE9tRFZJcGJVNDVyVlBjeUVnb1o4WUxD?=
 =?utf-8?B?QlR0V0QzLzNsNlpnUDRPVjAyRkJtSFlqdHZhb2RJTklJbXlBTzByUzlnQWNU?=
 =?utf-8?B?eURwQmhOUGxIZGRLS3l0dVZqOGxIVjRlYTRnWnRqQWVtRzhrUURlRk05MjV0?=
 =?utf-8?B?R3RmSTVlTzZsVWw3QUZVT3IxSGp2N2dvUW42RStKMEQzc1o4UGR6OWpLWHpT?=
 =?utf-8?B?WGs3SFd1T0FGQldKQnc4OFV6QzdVdG5rdjl4M1NXelVIenNVYUNKZTBIeWUy?=
 =?utf-8?B?d1MySVl6OXBzM0hGR29qbEZnQ0VMQktYanJORGhZU2IyTXlDYUwrZ0IwV1lo?=
 =?utf-8?B?eTArS1lVL0FQMlIxclpHTDhEelZlY1FUTUpYUDdZRFVLZDhselZZcWNGcGx0?=
 =?utf-8?B?T0VpT0pLbmFDWHJFQmF6NlgxUVpqRWM5QVJERGxQMk5GVUZJM0xTd2F6UnJM?=
 =?utf-8?B?YW9LNXdOUXhFanV0OVpOdzIzQzh1ZzhkUDV4QmNzUlU5LzBja3J3MHJieE9J?=
 =?utf-8?B?N3U1N3JWdHUxaE5XZitsQjV2cVpKTjRNOXc0b0xTY3VlNTdYTG9xYUNjcU5r?=
 =?utf-8?B?U3JVdlpvUk1VQVpFcU9nNUNUeGxKT0k4ZURYay9KVk5zazhzUG5qU01wZk91?=
 =?utf-8?B?M0dEdXhla3VJb25EZmVXYlZLemYrYVVwRzl2dTNTRCtZbEE0VDZ3SXNBajhi?=
 =?utf-8?B?WVhVK2NLSWd2VDRQMHJkU0FzR1NxUE1xaGliVFJTaGgreWp2MjdTYmkyZ1Bp?=
 =?utf-8?B?TCtqZHV2YVJad0NVSzlCaldIUmQ0WWE0a2lkUzA1cEJiRXZwVm5LRXB3UDd2?=
 =?utf-8?B?Vmd0akw2a2FQY1ppRDdmazlxb29oakZPVFNQTFM1d1UyZDlEZlJNSXViTk9D?=
 =?utf-8?B?cXVjNFA3NVJGTitiU2pYQ05Tb2Z0aXhVeFEzdUd2bmNCYWlmdlRlL3YydXE3?=
 =?utf-8?B?NWJrUDJFMEMxb09SMU9GRitMWGdvYlBxL3lmNkRhTGpvSlhnSnZFVWtUdUVm?=
 =?utf-8?Q?m0SLLtjaNZnnUFg3o5s+qHs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0c4ecf-74d7-4814-fc86-08d9ffe2e9ce
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 02:33:50.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfBlBwKO6usX1F3ku0bVOA1TtgcPQbyYt2am15wODYIhVsW4Js17JmkOxSvereipPxkkOF8DHro3Utvxk+3lzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2785
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
Cc: Rob Clark <robdclark@chromium.org>, Zain Wang <wzz@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 linux-imx@nxp.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-07 at 13:46 +0800, Liu Ying wrote:
> If the CRTC state is already inactive, it doesn't make sense to trigger
> the entry timer for self refresh work to make the display enter self
> refresh mode, because the disabled CRTC hints that either the entire
> display pipeline is disabled or the previous atomic commit is triggered
> by the self refresh work(the CRTC is disabled, while the relevant encoder
> and bridges could be disabled or not depending on the drivers).
> 
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Zain Wang <wzz@rock-chips.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Gentle ping...

Thanks,
Liu Ying

> ---
>  drivers/gpu/drm/drm_self_refresh_helper.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
> index dd33fec5aabd..e76eb3cd22c7 100644
> --- a/drivers/gpu/drm/drm_self_refresh_helper.c
> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
> @@ -204,8 +204,12 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
>  		struct drm_self_refresh_data *sr_data;
>  		unsigned int delay;
>  
> -		/* Don't trigger the entry timer when we're already in SR */
> -		if (crtc_state->self_refresh_active)
> +		/*
> +		 * Don't trigger the entry timer when we're already inactive.
> +		 * Note that the inactive state hints that either we're already
> +		 * in SR or the entire display pipeline is already disabled.
> +		 */
> +		if (!crtc_state->active)
>  			continue;
>  
>  		sr_data = crtc->self_refresh_data;

