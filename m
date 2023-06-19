Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8584734A0E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF110E123;
	Mon, 19 Jun 2023 02:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E9D10E116;
 Mon, 19 Jun 2023 02:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8tKMKa7DnPWMYG9KgYzwWzSjCT6uLmBK4AKdRDJBQtGq2AhgkEQOCn2/cnmAyhg5Hvh9lya/6HjvdQau16jKI5IZF7ppkVqE+PFTAOHDv7W+9I0PmJGvEzmp/RXGhTP3pklKLp3quOlHT+JMLaK5sIDCzRRMg9yZhlD5pIYS5PhEy5VvrGvI69TZUCZvA1IBSWZebDTNfZ6DGujMmA9jBIM2DPBAMCsYb+wrwRSLuXAtb/2B8njLeVw7xwAVknK601LDq73/+F2HfdcTa3G+9/R91aTA9VX1rb4IBrZ7WCq+xloS38hYtvRLX1j4Y3M85r9Bucp3+MW/1RsDrHtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIVueL8bM0F3uKFwqLYVYLNPNHqifvTJMZI985KhsUU=;
 b=fo7gk+yU8qFV3blHYPCXEO6MmvOD/DcYRoGPB4lI5NTeF9g3jozXrOUdZ+BlFa+Cnf7xbVcOG2FtrMLI49tTUGQm+ty1ii5d8p6Qm9vpxrBJDw0AQQMuziDyQ3FLwIohpvICFtktQ65DIvmRVXTHQGmDkfd8QnAnYcrYPAo/5QB6eGz84/BhaYwpuAomflw4YqUVuXIRp8SdNCBouWFzN7N+wbU0fdsHZc1VrfsMTrYyRs2pfQd5+KX+khsn4aC17khsBA30vcIyoLMzJDyFp3gqCclycKawezsxYcIvdRXXt1q51JWbBKqC1C3Glg62VOcH7JYAhSMu5eYzEvwdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIVueL8bM0F3uKFwqLYVYLNPNHqifvTJMZI985KhsUU=;
 b=IXe91tJRFo9XBaZpUIo64JHRfzWyukaGue8LLV2jTPrJYDhr9ZkprvCv/ZCmRhwgR2+kdVaUNXy99ovlQYUoyujR2MG4Q+R+hPjUkFqkuz4anSFJ/giWz/9dQA3SiJZZKoWAFFS6hr5yYrbBrB7Emft4QUSgOeWODkbAP+Tj6ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 02:17:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:17:32 +0000
Message-ID: <3c3dccd6-6772-d62f-f183-bd84e109a366@amd.com>
Date: Sun, 18 Jun 2023 21:17:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 2/7] wifi: mac80211: Add support for ACPI WBRF
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-3-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-3-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee8596c-902e-4cac-ff95-08db706b56d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiTI2Tl0nKw1ghX62G+TigTXzyZGr7S42FqmyHfZt1IoCiMsnvpb9FY9kb05naPIgWcSb4WlBuPpP7g38RFS/x7OPc6JM7KxRXUb1m+8I/TG4CaagK/qpalCEMqrNtXQCk38ebWWLD8FUosXBtyXsERYK3qnsOMSN9bzlSlTYQZ6VOsG5Qa+qvSUYRzRlumA/PqCfRghk/h7jECzbprUBiQd4fHpkfs1NVnw0oCJLru7CYEYXSsCX1M69bKId24BNOgfnDTl/1/ahk74gCJ55/b2QlvtVB39cvrBgUnQxnifx9aB9L/iYhsrHIycag2kO+pa0LuVPWwPVF0QVD5sXQDBdLvGw6A0MzWlMdu9mQW881gk0iuZhpyNOKfYe1CD5mkiHCIc0VeYYZGh3xLWe5JPz0xJbwZBnJCgEbKrR6UACAxFXlNKgnRwncu0P7Lc0DmaC3si2mGpXG2kItq7xPJyY4KC/D++jJjtTZm99NOl57llPS8+0X0huppr6GyoV19rSaY0sRLtazh1wFmFZAMo2cPpat6PrFZ+rCOeDQS3AXwQLhTEI0cJ39l43l5LrCfgaE5g/kph5qSyjOUqMZY7qG3BppVD7FWnfvCqq/h5nTm9XJzVt/PDnS3ee5tv2Bl8mKkrh9H6wwdA0gP6Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(31696002)(478600001)(2906002)(30864003)(6666004)(6486002)(37006003)(2616005)(86362001)(36756003)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(7416002)(6862004)(5660300002)(38100700002)(44832011)(316002)(4326008)(6636002)(83380400001)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWplUFdHazRyL0s4RmNjY2hLRW82ajM1T0c2czgrL2MyTWs4Ky9qL2ZjY0FK?=
 =?utf-8?B?NmdQVnhqclMwM09DZExuNU42aTNUWTNjVDBuQTNTazFlYUhSNnVrbEFqcWRO?=
 =?utf-8?B?bmFYQ01JSmlrRTNmckZlQXRDYm16Ulk3Yld5YTZxUno1Um1VMVEvU3JieWtI?=
 =?utf-8?B?RTlRRmxhUWNJMVZtL1h3bjM2Mi9EaVk3ZkQwTnhLVXgvSzl3YlRTWDgyMTdI?=
 =?utf-8?B?Qm96NTZoVmxkS1AzK0VPcEg5dk03QWVIalZ4MWlVSUFNdndKZHgrNUhPUjMw?=
 =?utf-8?B?YUhId1hrb2M2MDV0SGlSV2ZlWVRJSGlueFhIVUdYT1Y0cTVORVhqVDRuaTQ1?=
 =?utf-8?B?TzlKd0dLdkdtQWNlTDlHMVpvbmFYNDRkcEVVNzFBM2ZWekRWU2gvWUVpRTVK?=
 =?utf-8?B?dTdnWTlWUFYveHVwcCsvZGN4UGEwQnRDUjhnOThkMVY1aTVCb2N0MGxobDBT?=
 =?utf-8?B?eFV4d3ZpNm15VUc0TGk4TUZyOTRvY043Z1BIc095S2lnTlQxeUdXd2c3aElr?=
 =?utf-8?B?SWJxeXRkdkNqN25xRlF3bkt3QnAvemMvMHRPUklsSmNpQkdrWE5IRzRlZ0E3?=
 =?utf-8?B?RGl5ZnZQcTYyRFloRW5PME5OU0J0VVROYzlBSHlKY3NieE9PUXYwN2J5Mm5N?=
 =?utf-8?B?S3VCUmlCZ0ZZSHFOVEg4Ujh4MDl4U3UvUmNXZHRNbS8wcnBpVFpvUjNDazkx?=
 =?utf-8?B?Qk1ZR3hnek5jYkN4ZjIrSGlpZmdyOVg4THVUYnZyRkRrbTlmWEhGMStEaS9n?=
 =?utf-8?B?RVdOQ1E5YWZWajNuYTRpMUJPTFk4dmZYa2xDb2hBc09WS2xOS25QQ09VOTlB?=
 =?utf-8?B?OVdhODlTQmgzMU9kZ1I1eHBjRjZTc1JaMHdTcTBwSld1UGh5M2EvYS9uRXVQ?=
 =?utf-8?B?TWp1SElpbUlvNzZoN1lkcjFIaVNoRTVaR0FmMGp2MUhSelVjY21Vd3RscFVz?=
 =?utf-8?B?YW9LbU5WQjlrcy9pUC9vYUJCRW5SVWlRbm5tOWVkdWJhOXh4ZExucGRuK2lx?=
 =?utf-8?B?NkRRajIxMFM4clFUMGVUY1ZSRFNib3J6cndTc3IwbkcxcURPYitnRDZ0Tkxo?=
 =?utf-8?B?YmlmL3pKYzVySlZkKzRYaWlOdmRmdTJCUEZjUDcyWnRBZ0tITm1EeS9UUEMy?=
 =?utf-8?B?TkNDTWMyRVp2Mk56aTBpTS9KT2NFdzA1eE9UUmMrL1d1YkVmeEl5OFV3OGJH?=
 =?utf-8?B?NVpBV1dwdGtSQVNmU0dlSEhkS1BuRzEyRmdDU3JMVGxBU1IzaUtHNmp0Vll2?=
 =?utf-8?B?bmlWSi96WlNsWUlOT08zNUoza3p0N0JpUi9PQ3gvNGI2TkhpeVplRUg3YXZS?=
 =?utf-8?B?NTlnZUhBNmVzK1Q5YVZQMlRKMWoyQTZpSEhBMVFlWmVhZCtUMkVsOVVqNWFF?=
 =?utf-8?B?V1M4ZUUxM0Q5SnM1TE9Kb3psSFpLYjF1eU9DZ21aeDU3UjBHdm82QStmWmY1?=
 =?utf-8?B?M21uRjR6djdBbzFyTDhUeGxodzVEd2FlcVVzKzNwMlVXaVdhOU04ckNJeDgr?=
 =?utf-8?B?bjJkKzJIa25SdHY2UUY4eWVmSS9FYzRiSldtRmhqQVprV2FRZnJrQ2locVZ5?=
 =?utf-8?B?THg0VlRlQ0YxRkRrVHJRV1lZb0NXREI5S2JXWDlJTWdkQmVQR1NtUTMwSWFh?=
 =?utf-8?B?cFZBZ240NTAwN0ZGUUVaeFVWMTlLUzJLT2ZqVU5hQTBBZWNwQy94cTI4MXdt?=
 =?utf-8?B?dDc5Y2hRTWRQZE1BY3BUbE5vVGtabUl5MFJ3d2FwSHlRanhpejNhTElMQW15?=
 =?utf-8?B?SUsvaEJvN252MWh6dmpIRjY5OVVSNmtBRjZ1VHJFSEFCZ24yTjdFQXljZGl3?=
 =?utf-8?B?dlVQNGZrUEduOC84VnAxc3pqU1JxSU15RWhDNVRtWFUya2J4cFViQktxc1ZU?=
 =?utf-8?B?SUJpWVAwMW9oWWxwanY5SWZWaDhHT0diNnZKUFZJUXpSam12cXMxQVRnUDFm?=
 =?utf-8?B?RVRYbkd3OEw3bFgrRkJtblFONDNIUWdjeG5tazVmQy8zQ3gwYVUrRlhxMjFY?=
 =?utf-8?B?UmxlSy9yQ2FLeXhNUUYvb1VjaXJ0WkVHb2lHUzI0K3Bqa0p6Z25mRjFobzhy?=
 =?utf-8?B?dnBRaE41ODJJN3pyanB5Q25oVnoxcFRleWR4eXI2SmNIZm5RbWxGaGRQVVlI?=
 =?utf-8?B?Nk51U2t6NDgxSGk1R1UzTHd4L0JoamhQSFpvT1NNRWJBSUlrK2J5dnJyb0Nk?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee8596c-902e-4cac-ff95-08db706b56d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:17:32.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HMjej9wrEGB/2vpKYVaKsn0iLRoJ+oR2AmS4NCvyUxh6XyjFl+P6o9T00O+RJnECXZoAGtxZozky3d6rxHevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905
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
Cc: ryder.lee@mediatek.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, lorenzo@kernel.org, kvalo@kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lijo.Lazar@amd.com,
 linux-acpi@vger.kernel.org, shayne.chen@mediatek.com, matthias.bgg@gmail.com,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, nbd@nbd.name,
 Christian.Koenig@amd.com, sean.wang@mediatek.com, lenb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 01:57, Evan Quan wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> To support AMD's WBRF interference mitigation mechanism, Wifi adapters
> utilized in the system must register the frequencies in use(or unregister
> those frequencies no longer used) via the dedicated APCI calls. So that,
> other drivers responding to the frequencies can take proper actions to
> mitigate possible interference.
> 
> To make WBRF feature functional, the kernel needs to be configured with
> CONFIG_ACPI_WBRF and the platform is equipped with WBRF support(from
> BIOS and drivers).
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v1->v2:
>    - place the new added member(`wbrf_supported`) in
>      ieee80211_local(Johannes)
>    - handle chandefs change scenario properly(Johannes)
>    - some minor fixes around code sharing and possible invalid input
>      checks(Johannes)
> ---
>   include/net/cfg80211.h     |   8 +++
>   net/mac80211/Makefile      |   2 +
>   net/mac80211/chan.c        |  11 +++
>   net/mac80211/ieee80211_i.h |  19 +++++
>   net/mac80211/main.c        |   2 +
>   net/mac80211/wbrf.c        | 137 +++++++++++++++++++++++++++++++++++++
>   net/wireless/chan.c        |   3 +-
>   7 files changed, 181 insertions(+), 1 deletion(-)
>   create mode 100644 net/mac80211/wbrf.c
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 9e04f69712b1..c6dc337eafce 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -920,6 +920,14 @@ const struct cfg80211_chan_def *
>   cfg80211_chandef_compatible(const struct cfg80211_chan_def *chandef1,
>   			    const struct cfg80211_chan_def *chandef2);
>   
> +/**
> + * nl80211_chan_width_to_mhz - get the channel width in Mhz
> + * @chan_width: the channel width from &enum nl80211_chan_width
> + * Return: channel width in Mhz if the chan_width from &enum nl80211_chan_width
> + * is valid. -1 otherwise.
> + */
> +int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width);
> +

It's up to mac80211 maintainers, but I would think that the changes to 
change nl80211_chan_width_to_mhz from static to exported should be 
separate from the patch to introduced WBRF support in the series.

>   /**
>    * cfg80211_chandef_valid - check if a channel definition is valid
>    * @chandef: the channel definition to check
> diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
> index b8de44da1fb8..709eb678f42a 100644
> --- a/net/mac80211/Makefile
> +++ b/net/mac80211/Makefile
> @@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
>   
>   mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
>   
> +mac80211-$(CONFIG_ACPI_WBRF) += wbrf.o
> +
>   ccflags-y += -DDEBUG
> diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
> index 77c90ed8f5d7..0c5289a9aa6c 100644
> --- a/net/mac80211/chan.c
> +++ b/net/mac80211/chan.c
> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80211_local *local,
>   
>   	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
>   
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
> +
>   	ctx->conf.def = *chandef;
>   
>   	/* check if min chanctx also changed */
>   	changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
>   		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
> +
> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> +
>   	drv_change_chanctx(local, ctx, changed);
>   
>   	if (!local->use_chanctx) {
> @@ -668,6 +673,10 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
>   	lockdep_assert_held(&local->mtx);
>   	lockdep_assert_held(&local->chanctx_mtx);
>   
> +	err = ieee80211_add_wbrf(local, &ctx->conf.def);
> +	if (err)
> +		return err;
> +
>   	if (!local->use_chanctx)
>   		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
>   
> @@ -748,6 +757,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
>   	}
>   
>   	ieee80211_recalc_idle(local);
> +
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
>   }
>   
>   static void ieee80211_free_chanctx(struct ieee80211_local *local,
> diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
> index b0372e76f373..f832de16073b 100644
> --- a/net/mac80211/ieee80211_i.h
> +++ b/net/mac80211/ieee80211_i.h
> @@ -1591,6 +1591,10 @@ struct ieee80211_local {
>   
>   	/* extended capabilities provided by mac80211 */
>   	u8 ext_capa[8];
> +
> +#ifdef CONFIG_ACPI_WBRF
> +	bool wbrf_supported;
> +#endif
>   };
>   
>   static inline struct ieee80211_sub_if_data *
> @@ -2615,4 +2619,19 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
>   				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
>   				    u8 eht_cap_len,
>   				    struct link_sta_info *link_sta);
> +
> +#ifdef CONFIG_ACPI_WBRF
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local);
> +int ieee80211_add_wbrf(struct ieee80211_local *local,
> +		       struct cfg80211_chan_def *chandef);
> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
> +			   struct cfg80211_chan_def *chandef);
> +#else
> +static inline void ieee80211_check_wbrf_support(struct ieee80211_local *local) { }
> +static inline int ieee80211_add_wbrf(struct ieee80211_local *local,
> +				     struct cfg80211_chan_def *chandef) { return 0; }
> +static inline void ieee80211_remove_wbrf(struct ieee80211_local *local,
> +					 struct cfg80211_chan_def *chandef) { }
> +#endif /* CONFIG_ACPI_WBRF */
> +
>   #endif /* IEEE80211_I_H */
> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> index 55cdfaef0f5d..0a55626b1546 100644
> --- a/net/mac80211/main.c
> +++ b/net/mac80211/main.c
> @@ -1395,6 +1395,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>   	debugfs_hw_add(local);
>   	rate_control_add_debugfs(local);
>   
> +	ieee80211_check_wbrf_support(local);
> +
>   	rtnl_lock();
>   	wiphy_lock(hw->wiphy);
>   
> diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
> new file mode 100644
> index 000000000000..2e1a58cf4dbf
> --- /dev/null
> +++ b/net/mac80211/wbrf.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/wbrf.h>
> +#include <net/cfg80211.h>
> +#include "ieee80211_i.h"
> +
> +#define KHZ_TO_HZ(freq)		((freq) * 1000ULL)

I think this new macro probably should live in include/linux/ieee80211.h.

> +
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local)
> +{
> +	struct device *dev = local->hw.wiphy->dev.parent;
> +	struct acpi_device *acpi_dev;
> +
> +	if (!dev)
> +		return;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev) {
> +		dev_dbg(dev, "ACPI companion not found\n");
> +		return;
> +	}
> +
> +	local->wbrf_supported = wbrf_supported_producer(acpi_dev);
> +	dev_dbg(dev, "WBRF is %s supported\n",
> +		local->wbrf_supported ? "" : "not");
> +}
> +
> +static void get_chan_freq_boundary(u32 center_freq,
> +				   u32 bandwidth,
> +				   u64 *start,
> +				   u64 *end)
> +{
> +	bandwidth = MHZ_TO_KHZ(bandwidth);
> +	center_freq = MHZ_TO_KHZ(center_freq);
> +
> +	*start = center_freq - bandwidth / 2;
> +	*end = center_freq + bandwidth / 2;

What do you think about using cfg80211_get_start_freq and 
cfg80211_get_end_freq and then converting the result from them to HZ 
instead?

> +
> +	/* Frequency in HZ is expected */
> +	*start = KHZ_TO_HZ(*start);
> +	*end = KHZ_TO_HZ(*end);
> +}
> +
> +static int wbrf_get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
> +					struct wbrf_ranges_in *ranges_in)
> +{
> +	u64 start_freq1, end_freq1;
> +	u64 start_freq2, end_freq2;
> +	int bandwidth;
> +
> +	bandwidth = nl80211_chan_width_to_mhz(chandef->width);
> +	if (bandwidth < 0)
> +		return -EINVAL;
> +
> +	get_chan_freq_boundary(chandef->center_freq1,
> +			       bandwidth,
> +			       &start_freq1,
> +			       &end_freq1);
> +
> +	ranges_in->band_list[0].start = start_freq1;
> +	ranges_in->band_list[0].end = end_freq1;
> +
> +	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
> +		get_chan_freq_boundary(chandef->center_freq2,
> +				       bandwidth,
> +				       &start_freq2,
> +				       &end_freq2);
> +
> +		ranges_in->band_list[1].start = start_freq2;
> +		ranges_in->band_list[1].end = end_freq2;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wbrf_add_exclusion_wlan(struct acpi_device *adev,
> +				   struct cfg80211_chan_def *chandef)
> +{
> +	struct wbrf_ranges_in ranges_in = {0};
> +	int ret;
> +
> +	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
> +	if (ret)
> +		return ret;
> +
> +	return wbrf_add_exclusion(adev, &ranges_in);
> +}
> +
> +static int wbrf_remove_exclusion_wlan(struct acpi_device *adev,
> +				      struct cfg80211_chan_def *chandef)
> +{
> +	struct wbrf_ranges_in ranges_in = {0};
> +	int ret;
> +
> +	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
> +	if (ret)
> +		return ret;
> +
> +	return wbrf_remove_exclusion(adev, &ranges_in);
> +}

I don't really see a good reason for wbrf_remove_exclusion_wlan and 
wbrf_add_exclusion_wlan to be static functions.
In the earlier verisons they were both in the ACPI file so it made sense 
as an exported symbol.

But they each only have a single calling site now and I think they 
should collapse into those functions.

> +
> +int ieee80211_add_wbrf(struct ieee80211_local *local,
> +		       struct cfg80211_chan_def *chandef)
> +{
> +	struct device *dev = local->hw.wiphy->dev.parent;
> +	struct acpi_device *acpi_dev;
> +
> +	if (!local->wbrf_supported)
> +		return 0;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return -ENODEV;

ACPI devices won't go away, this should be an impossible failure.
When wbrf_supported was populated earlier on the ACPI device was checked.

> +
> +	return wbrf_add_exclusion_wlan(acpi_dev, chandef); > +}
> +
> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
> +			   struct cfg80211_chan_def *chandef)
> +{
> +	struct device *dev = local->hw.wiphy->dev.parent;
> +	struct acpi_device *acpi_dev;
> +
> +	if (!local->wbrf_supported)
> +		return;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return;
> +

ACPI devices won't go away, this should be an impossible failure.
When wbrf_supported was populated earlier on the ACPI device was checked.

> +	wbrf_remove_exclusion_wlan(acpi_dev, chandef);
> +}
> diff --git a/net/wireless/chan.c b/net/wireless/chan.c
> index 0b7e81db383d..227db04eac42 100644
> --- a/net/wireless/chan.c
> +++ b/net/wireless/chan.c
> @@ -141,7 +141,7 @@ static bool cfg80211_edmg_chandef_valid(const struct cfg80211_chan_def *chandef)
>   	return true;
>   }
>   
> -static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
> +int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
>   {
>   	int mhz;
>   
> @@ -190,6 +190,7 @@ static int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width)
>   	}
>   	return mhz;
>   }
> +EXPORT_SYMBOL(nl80211_chan_width_to_mhz);
>   
>   static int cfg80211_chandef_get_width(const struct cfg80211_chan_def *c)
>   {

