Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B555A6E9E8A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9CE10ED0B;
	Thu, 20 Apr 2023 22:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6974F10ED07;
 Thu, 20 Apr 2023 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682028270; x=1713564270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ilSmu4mQaRZIqRUNEtao21hofvrzJz7Q+CyiUuTkgWY=;
 b=YYnGU/qVq7VZYrtiHKTZ0Pvuh6KF2MblE4V7/2cfpuYPpOkCNADhogZv
 +vURtVG0o2Gy5oMrg0VF8pYY5dj4zH7KqTwIvA38VaFgHqPlQSn5okod3
 ZHlKl4xruNpNtbl9Nxj5z7aRL2r66ML36HGVUXO7UKOkZva3NyqH3cyu5
 zNPLnnSfMAPK8bEK6Tb8UHzmoaU8jHY5XyVs4ZMvYXOtx3PT5bb09i1Zo
 LGEOnopab8xOmxxHGUMfuu+xiY8LYnyuEDUZPkc0qyF4Z8ZSBZchd7A3a
 KDbHm1tZFP8PPN/QvoLovrBFqkhXy5kabmrMYfR7vvXuplWG2GWpXSA/8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334729873"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="334729873"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 15:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781387535"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="781387535"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2023 15:04:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 15:04:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 15:04:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 15:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4dTdVg24wQ6q6PVGQiuXnlaMTymkEFa9/XlUjN5/SxnyN+9u9MVZbDEFEI5RTpG55hBDbhkq+TMdYSCKkvkwJyUsFG5flycwXckL718VoPnJLPi+XDKRAaysWBEktEeigNoTSf8nHucxcp6Xi0HUXze1l8lANL/5WNmVnaMZgQzsmCZ1PB7j5ZzEJHVrfcGVYnFfavtk0RFaCDQc1OEzIsUsYgcYL5137GSaOO9OhC/Aee6Ixry49FAel+H1rePXyu/1ov1rMIapf8+Tj+QIjXqdBOMnZFOnIwsERJ3xBL0r42mqTxaxtXpCrwiIHhh0jUZHm1Ao4bY1mCHZMA4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=490hpYwWtNMC9BB1S2azHiKrxHVENE2NcHm8RzDLgcc=;
 b=LvUTmmiWW8NgdwG94VkO63waojeKcjzusZT/xrPK+MXpyS3jg4c7MDHkPie5F1xAIl5jqHKD2kBwP/1zoaApG2EBy7+tDbetJ1ta57/KcugyYJZnCN+pebNWKEzNtChmlv4bpDlXnqxf9ApaziI9rbc/eN6aAusq1LCVarh3S9gF/yagyUaPXZWW201M27i+W4Yg36KWEq7nNKlP95sB9ctYjfe0Rta/xNE19U7F2FUkJrZRhPBZOAgzvzjofQNwwFfqp8enNKXvmrPR+iuL7XyAX8hcOGy1qhseHos0h91g/RjPhIlumhSDfHFVnUuiNNWwEwC6FgVuAcpYryOZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 22:04:26 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 22:04:26 +0000
Message-ID: <553a192a-f52a-a3fb-4f20-ed79bf75f0c6@intel.com>
Date: Thu, 20 Apr 2023 15:04:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-3-daniele.ceraolospurio@intel.com>
 <612b04c9c35f1f67083ce5cb889f909fb89bb066.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <612b04c9c35f1f67083ce5cb889f909fb89bb066.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: a564b520-aca1-4f5d-d959-08db41eb349b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlyKj2H4Dd2a2+uMQThK5K6JEznULLWdKNA+R/L0JCCrvXQHHd6nLhne2HShXYYlMabGf36l7SvDGLc2QvfCgtgoP4ousOcUOsTeEr2D+nhU6I9jsxjkshLn6L7aj+NAC77+fReEQOZuprG9MtPW1Og5OY7wHwZn6pNJqToomtwyA6vfz2XSK+/5szyVvRq9MqZZLncU8V1ErBtl7k43b5py0JUfc6h5FX/4YMZH79/MfLX2YmQq3DfXrur7WZCii+pVtgKOObo+bsdGJ/vang0EYnTkRz5llkANeYrqaWB29e66CWdXtNcFoPXN943q5ndibwND/T9TxneaVHljUZnrC1fCTZQuwkPHg4BNo08YOkFkousS6XBGh21Yyxek2TrG4c769yYGyomy5mnn+eYPx5Ihugb8JvFhWbw7OodwirPnHka8/RXYpFCxP13V2g8cTLkXVLbtLn0RzOnu/i2M7+QSjB5mcF9k6Ft0n3YO+6HIVQubolkvZvi4gwBYv19qHXjPt735FgS9IL8WYjB5hjJFX91tNS/SLLtIlwfNmrOLE6NLjOTqo+0s0kIUHNeyvVbmeSpuFQeKyslX6XX+YlCklgJalJmj3E5pUCa0pmnaJyLz6Ytp/n9w60hRlBZLc/GhehbzXPZ0ulzmig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(2616005)(316002)(66946007)(82960400001)(4326008)(966005)(66556008)(83380400001)(6486002)(478600001)(54906003)(41300700001)(8936002)(8676002)(38100700002)(6666004)(110136005)(66476007)(2906002)(31696002)(5660300002)(107886003)(53546011)(26005)(6512007)(6506007)(186003)(31686004)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRaUlQ5WXdmanRyaUpwM0UxSlRCZytlYTlWZ2duQWxZOWhZYUpFVVJ2NWxI?=
 =?utf-8?B?eS9hNWtzNFo2WmFvK0lTVjU3QVJLUm5CQ05ZOGVkYU4zSlQ3eGo3QlZBb2dD?=
 =?utf-8?B?T2g3QnVoTmxaUWUxbmE3RllidG1ycE1pbFc4Q2JHS1RESVZPU2JRanI4b3RS?=
 =?utf-8?B?RVJGWWRrME9ld1pXQWxWaGFPSHJGcHZRVGdyS1Y0bVVQR3ZRU3dseUphenZZ?=
 =?utf-8?B?UXphbU9OZXpyZk9ZZi83WkRGY20xY2hHSkFTLzBhWE02MFZPSzBxV2hOMjZo?=
 =?utf-8?B?eXBzNkFKaXlqcnZ5OHkwTUQvL1lic3BSRU9aTmtWcGdmamZVcUJHNWxZK01t?=
 =?utf-8?B?VU94Zk9LaTcwNWRBU0xyNERhc3JlUnQ2d3JOcHh1MWlIRm9uQnZ0aDZZbDdR?=
 =?utf-8?B?SmJSS3VkR3ZRVWtjRjNOZHdxRGNxTDl6d0k2WE50Vy9aWFVFTUpFL1NzQlFF?=
 =?utf-8?B?Tko2ckJIaCtLbXRpVmRFeEUxWHlJb1BlZXNKQ2RXSmozQXdiMTlnbW9tV1d4?=
 =?utf-8?B?RURicFNwaXdCcDBxdUdJdUFlT0ZCbWF1ZG9qNUhHUWNIZ3k2aDdvOGM2M2Jx?=
 =?utf-8?B?clJQU1pDVVN4Q1JYSXRjbGhTZVE5WWs2K1dnL1BlNU9FaElJc3k0M05CS3Nl?=
 =?utf-8?B?d2tYMmF6b1dPQW94WGkxT0Z2OUpLYjBacVF6MU55OFp5NEIzNGZwbG9vV1M0?=
 =?utf-8?B?a2dVQWMxUk15WDRJT09lWE9ySVFpT0VzWE5QaUxhcjFjQVkzaEM1aUVXRHlU?=
 =?utf-8?B?UVhSTmRJQzlVRjNxYnVGQXVvVWNmTU9CdkZoNWRZMlRWMG50ZlBWSjhZMzI3?=
 =?utf-8?B?WUZKT042dVZKS0NwVEt6NDVtQ0FBOHJLSnhYbyt6ZThZdlNpQnQ2VklZWWJW?=
 =?utf-8?B?M2NQbGFtamgvQTRyMFJlclBEcE9qYUpidDMweC9adEdheXY5ejUvZ2h6ZDFC?=
 =?utf-8?B?eXdGZDgxa0pLTjhxWVNGV2d1cnVMbHBqNmZDWGVqcml4dnZTNDJzY3BvOGVz?=
 =?utf-8?B?N3NsRjFCbm9RRkVLcDEyWG1pTlA0ZHVpL25tT0JDYUhtcFZ3QUZvcGtOb3JG?=
 =?utf-8?B?dTVPc0NoeEQwQmJJekhjVmxWSW1UUVlnSDhHNGkxdG9zUS9FejdGYVhPUFlW?=
 =?utf-8?B?YTFVN3FEMk9UOUh3SU5KZVRKdGxORjhWRW8vTXV4N1k3M1hMRE5yTThjWDFF?=
 =?utf-8?B?MjJtWlFlSzRzaTAzdDJtQ3BuZnZQUTBocVJDVGhDNGFncmozV2p4b1c3allo?=
 =?utf-8?B?cVYyVEVXU3JMSG5LOHBkMUI5TndHblkxNDN1aHRDRmJlTjZsanZjZks4WldR?=
 =?utf-8?B?RnBGTzJpQzZtRkpHcXBBcHZ5b0xTMUV3SE5pem9KRFVERFlnUWN5c0NpR3ZZ?=
 =?utf-8?B?Zmg3eG0rb1huRmdPMThURnFvNzhoeU8vV2VYSHgyeHhQT09rTFVqUVVIcHJw?=
 =?utf-8?B?K0VYeHJtcFZKYmdpSHJPRzJNTGlQZDZQTEVCRUNvalVSKzM0SFF6bXNZczVV?=
 =?utf-8?B?VDdMSWhCUnBYVThrNjJibkhRR1psTkV0RHd4US9EZlgyVDEyMzdBMnJUb3pm?=
 =?utf-8?B?eEpPSmg1a09QZ2U2VzFkTHFoOFRmSTNsZnpaYXRsQXp0OUE5cGJBZWo3Rnln?=
 =?utf-8?B?S1p2aTUrZDEwdG9hbmhQdzJvd1VPUGh6cG5JREZxaFEybDhvYWhRQ1VGM2l3?=
 =?utf-8?B?SEk4eGloVndHMnY4SHVVcTNYUnlYT1d1Wk8wcjRzZ1VpT0dUbmpsYVlLdW45?=
 =?utf-8?B?bS9XRkdMcmRCUzQwSktYUFBNQW5RRDFic2JYeHgzR0k1M0JEWXdDWHBkdVFz?=
 =?utf-8?B?NWdGMmJId1psSTVPU0dOUXVLWDZCbTA5Zk1CT0wwQU1MNmwxUFlsMDV1MGow?=
 =?utf-8?B?T2dpaUpTOExOOGhLY0NTY1JBeHZ6UHJadEI1ODBpY3RQTFp3dW1nb3c4bEhl?=
 =?utf-8?B?aHpZTk1mOTVXZ3Jqb0hySnh4NFN2K29RMnFVQXdUTkE5a3ZYS09xZkZjS0ZG?=
 =?utf-8?B?NXZDSlpuM0ZwRi9BY2VWOVQrMGI4YmYvbFZFWDlMQTJsdjcyVUVaWW5WYUEr?=
 =?utf-8?B?aVFqZ3JWWUd4Z3VMbGlramkwc3RhRmVQSmltZGZGaW14YllxZkdNWTE1Y09I?=
 =?utf-8?B?TzM5QzJhQ0IxMW9EczRCMHZoZHRWdUh3aUFRWEx2eU56ZVlBNGlyTEVaQTNS?=
 =?utf-8?Q?2voeu1i2G75UKqF2JwvlbSY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a564b520-aca1-4f5d-d959-08db41eb349b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 22:04:26.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IrQGwTzQTd8iKUYDsjg2HSRXp/kh5Zt6Bb7vXio4pGwD1nMvnInp9ENrglsf1UWwfgq1qO1TKucx3nl+7dRdSIzBru7Nuys/gVSQV8QMaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
X-OriginatorOrg: intel.com
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/18/2023 11:57 PM, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-03-29 at 09:56 -0700, Ceraolo Spurio, Daniele wrote:
>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>
>> Add GSC proxy driver. It to allows messaging between GSC component
>> on Intel on board graphics card and CSE device.
> alan:nit: isn't "Intel integrated GPU" clearer than "Intel on-board graphics card"?
> Same thing for the Kconfig description later (or am i missing something else here).

Will change

>
> alan:snip
>
>
>
>> +         MEI GSC proxy enables messaging between GSC service on
>> +         Intel graphics on-board card and services on CSE (MEI)
> alan:nit: same as above
>
>
>
>
>> diff --git a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
>> new file mode 100644
>> index 000000000000..953eda1a16fb
>> --- /dev/null
>> +++ b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
>> @@ -0,0 +1,208 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2023 Intel Corporation
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +#include <linux/mei_cl_bus.h>
> alan: [nit?] i thought we need to have the headers alphabetically ordered? (below too)

Will fix

>> +#include <linux/component.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/i915_component.h>
>> +#include <drm/i915_gsc_proxy_mei_interface.h>
>> +
>> +/**
>> + * mei_gsc_proxy_send - Sends a proxy message to ME FW.
>> + * @dev: device corresponding to the mei_cl_device
>> + * @buf: a message buffer to send
>> + * @size: size of the message
>> + * Return: bytes sent on Success, <0 on Failure
>> + */
>> +static int mei_gsc_proxy_send(struct device *dev, const void *buf, size_t size)
>> +{
>> +	ssize_t ret;
>> +
>> +	if (!dev || !buf)
> alan: nit: not sure if we should be checking for !size here - i do see that next patch
> is checking for this from i915 side of the interface... but just wasnt sure which is the prefered style
> (in terms of where to check for this condition). Either way, its a nit for me since i traced down
> all the way to mei_cl_alloc_cb and it looks like mei bus can tolerate zero sized messages.
>> +		return -EINVAL;
> alan:snip
>
>> +static int mei_gsc_proxy_recv(struct device *dev, void *buf, size_t size)
>> +{
>> +	ssize_t ret;
>> +
>> +	if (!dev || !buf)
> alan: nit: same as in the 'send' above,.. not sure if we should be checking for !size here...
> or perhaps 0 sized recv is supported.

AFAICS the lower level of the mei code do allow for size 0 for both send 
and recv. Also, this is the same check as what we do for the PXP component.

>
>> +		return -EINVAL;
> alan:snip
>
>> +static int mei_gsc_proxy_component_match(struct device *dev, int subcomponent,
>> +					 void *data)
>> +{
>> +	struct pci_dev *pdev;
>> +
>> +	if (!dev_is_pci(dev))
>> +		return 0;
>> +
>> +	pdev = to_pci_dev(dev);
>> +
>> +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
>> +	    pdev->vendor != PCI_VENDOR_ID_INTEL)
>> +		return 0;
>> +
>> +	if (subcomponent != I915_COMPONENT_GSC_PROXY)
>> +		return 0;
>> +
>> +	return component_compare_dev(dev->parent, ((struct device *)data)->parent);
> alan: do we care if both these parents are non-null? i notice in other mei component
> drivers match functions we do check that.

Those should always both be non-NULL, since both the mei and the GFX 
device have the PCI bus as parent (and the previous check on pdev 
ensures those are the 2 devices we're handling at this point).

>
>> +}
>> +
> alan:snip
>
>> +#define MEI_UUID_GSC_PROXY UUID_LE(0xf73db04, 0x97ab, 0x4125, \
>> +				   0xb8, 0x93, 0xe9, 0x4, 0xad, 0xd, 0x54, 0x64)
> alan: apologies for the newbie question, but why are we using UUID for the gsc_proxy
> as opposed to GUID like the other mei components? i am not sure if i read the right
> archived patch review but it sounded like GUID is for internal to kernel only whereas
> UUID is for external too? (in which case why are we not using GUID for gsc-proxy?)
> Consider this a non-blocking inquiry since i assume mei folks have reviewed this
> prior and this is an explicit design decision that I'm just not versed on.

AFAICS all other mei components use UUID_LE as well. The code was 
updated from GUID to UUID_LE in:
https://lore.kernel.org/all/20221228160558.21311-1-andriy.shevchenko@linux.intel.com/

Daniele

>
> alan:snip

