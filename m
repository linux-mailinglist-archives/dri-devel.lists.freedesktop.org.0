Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680F343D26
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422089A75;
	Mon, 22 Mar 2021 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1D89A16
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJLQSDXq33bqkBGfM/Zjq0t2XBEH1GvYasxaTnTsaXp66qKsywuTXONb+7qhxDY/W2CmZbUoGT3BU2WqHR3GwVY5fAATc8eyt3x3SS01t8gfM5DlnMmz/DcTxVPdfkbyJ33MaIkejBE2vZ2+e83O52bikHmSaXsgSsxi33ws+uYan/oEaDOIAQmfN9KV815yIjyA10MIbgmBc9hlBEpomlSRkytsAtOxNsmibpDiwLiMRKySELNBRExEmOS2OK6q7SMGy6D+SUGTmhp2kj0JkuXgMa1f1MeEItZHxBUksCKGmd/e1ASw6d11FVV7boTvl5Iqp8CpRb+BMt16BpyCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqVlX5JK8U4T8LbKX8QARFpUjAVa1LrTyeODolsLUJo=;
 b=bJ4+TRpuVWIE/Z0U0x5nU0xsnNrXv1otVVUqNfEtxll3/2k8qTwmuxW6jaW43T/dOmbUddZCwly5d30u4Jm2f+4MAJON9GvmbtLQtsHQHEsQqGAhQIWqraNywlArFb+WoG3QLioiAvDCSvV2XQJ5N+//2rcz6C0v5xQJ2jlH/bBwL7AgrBDiuQ/32U1U4txVmcaKqbyBaELervIliMGFYKz8ttoyCi3bR33rrewG+DsOjEruixNN2vVPRgKMv0r7apBLxC6BwnSaIFwC1d24M6dVhj5b7c8CoKM4o85m7N84qolC7yA93JCb81LwCbWHHZo1iyEb120TqQzjZUBJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqVlX5JK8U4T8LbKX8QARFpUjAVa1LrTyeODolsLUJo=;
 b=PcoCzeJxyer6EQT83NJ9tWaJB0goq+/oxrGcWA8F2XPTlFdiLpJX0UR61f878n3CQdjSFThxYIUrXuYy0QibLV4tERnGrygUxiYd9pSuKYVFKyfs64xqXMNlRHLI3h+W/H45O+r5zoVP54YK4bcS+SDSeAlLV+kmM48m9bI0ORs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (10.171.255.30) by
 CY4PR11MB2039.namprd11.prod.outlook.com (10.169.250.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.23; Mon, 22 Mar 2021 09:44:09 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::d4fe:8135:d8fa:81c0%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 09:44:09 +0000
Subject: Re: [PATCH] drm: xlnx: zynqmp: release reset to DP controller before
 accessing DP registers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210320083739.724246-1-quanyang.wang@windriver.com>
 <YFZWW8IPhVff/VkS@pendragon.ideasonboard.com>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <0e31f198-ba0b-4ab7-7439-e75de4c1c120@windriver.com>
Date: Mon, 22 Mar 2021 17:43:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YFZWW8IPhVff/VkS@pendragon.ideasonboard.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 SJ0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:a03:2c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Mon, 22 Mar 2021 09:44:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a59b1e-93a3-4d1c-3485-08d8ed170a8a
X-MS-TrafficTypeDiagnostic: CY4PR11MB2039:
X-Microsoft-Antispam-PRVS: <CY4PR11MB20391C65381F1FBCAF01C795F0659@CY4PR11MB2039.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVDKAf3tRRG456jPFwl3IhisrsMu+UE71raLlukU8cK0kDaxGE4KflN3OCcTbuwG7IEhKwmKwlrGSQr7hYIEJTN0MnioOBooq9Cn82NJzyxa6K/kUVMhncU9Pozu+9EUEU85eW/m3/ONLaA/s8nWrnlMLfeHuPJmcyAAfEiUrjQQ7ZoFYILZMEwojqVtJts0e77j1iwLBiiSir8nZNW/5vpnxUwPs9IhmhZkAWk/ynbcu7PV2W2wN2l00NPYmpAHfAyPb8WacS/C86cx0G5EX4mqmeovpSTyKcNBmKYdGz/htW6c8p6sQf8Ennz5lrYkLqIZQidjHfqems3Jrv75ffD3d8D0MvjbKdmEV1CskEkTIDRbrSQugZgkEMFs+kWzLUWcQH8CvfJ8HyUdV+IdYP0lEOF/JtqN8kp0IxN72qykazUBp+J95AT6GVg357K1nZ0Vd2KPb+f1fBGzKX5VhRrMt7nt07WYRx2kFSUPuUuiOxQJIhMzWJ+L9xk+d00C3kz5ZEeYBFNrhOYW7hh90FesMTbx/XiEAAPFy9LgCexG2AwNnB6OGtXshlAOcXsqSst3P41GYuXiORCpjawPGsxq2Vg7yv8thIIukiv8q/56S2mXLb1zsC3wjENAxmqAomZ/cTKKTtiBGpF6zstTnk37T9qa9a6Ztbjj3GZK+Vct/x81OOgerbm3mvjSAnCENZiKM5aeTz3AXmR4j+H8A4XpjwIGO3zdHTxubQs0oCY+KtYmnJCWYIZ58YigwJMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(478600001)(6666004)(2616005)(38100700001)(956004)(6706004)(8676002)(6916009)(5660300002)(2906002)(53546011)(8936002)(52116002)(316002)(16576012)(16526019)(186003)(54906003)(66476007)(66556008)(36756003)(31696002)(26005)(83380400001)(6486002)(66946007)(86362001)(31686004)(4326008)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wm4wYXl0bWtlcnMraVd0eHJCckJHOVp2TytmdytVLzVWemhqNTBKTm9ueFZy?=
 =?utf-8?B?VUM5enJ0NWdjRWZHU2Z0VnBaUElqZGVld0dKTGQ0WElwMk1lVjYrWi92dXBN?=
 =?utf-8?B?dS9IRE1Ya2ZIY0VKRCtJanppOHI0TWkrNVh0djFvR1VZL1Z2MXNubkVVa2lv?=
 =?utf-8?B?NTgzczduQ1VUNCt2dFNqTlI5a0MvRXVKR2FERkVQYVhKbjhodGpKUGJQcFB5?=
 =?utf-8?B?OThzVktwYjE3MWlwMnpYS2VjVFkvcDc2QnNNTnFzVjRob1ppK1dvMWl0dDR4?=
 =?utf-8?B?Rmo3MGxnNmFqTmFITmRDN1MxSVBPMVI5RnB3MTh3Rm9acnBtN2JOWVJSRWJ1?=
 =?utf-8?B?TzN3Mk9XbG81NzhsSldHWHpHRDFqaXNXVEpCeGxuZ1FNNTBUWWlVeHZLalZI?=
 =?utf-8?B?aklLTjlEOVhZZm5JWVJLcW5aZGdEeEhkNGNiUWltbDU4OWhKVFhSNjJWUGwr?=
 =?utf-8?B?OWZvQk0rVFVnejhNb3pkU2ZtUERLb1RBWk5lcUJGQUVsNEhqbjVQQ0RyRVJV?=
 =?utf-8?B?R29RVThZUENJODBLRmNvc1VYNFAyNlNzK29FUUJ3ZCsxb3d6RkJiMC9va1k5?=
 =?utf-8?B?KzJYbUorY0ZnZDcwNEdYc01tK3JFdTROZGY5NmgwcjR2N1dMaHN3KzFrbzhr?=
 =?utf-8?B?ODlwa1FwV1VuMUUxeE9xVnk3cG9hOWRKSW8xdWp4Zy9DYWszRUhUT0IzL0tQ?=
 =?utf-8?B?ZkxIZHJDQktIakNVZ2UwUWpLNDFYM0V5aHZPaC9Ba3JqOCtvN2crSEEyODN0?=
 =?utf-8?B?NkdBaUJhUm9HN01PY3FUMDlCM3BHOHQwalc4anRMTzZycmxZT1dNQmVncjZt?=
 =?utf-8?B?QmZKU3JyVlY3ZXRkZkpKd1hSbFlhWXd4ejRWOTNJTWhsOVpLUmdnYWUvZXJ0?=
 =?utf-8?B?M3NSdFYrQytxbHhMRm1QS2llNFFQWThXSjhaUWxoOXBBa2tqU1R1OU9kVVJT?=
 =?utf-8?B?RTZMbkRvdldIU2VTU2ZxcmZ2V2E5TTMwd2g5T1VjRUJEVVoyWnVhWFVoUTNt?=
 =?utf-8?B?Ynord05kVk5WU3k1d3BuSkVPc0g4SC9ZTVV6dTlqR0Y5V0w1d3I0dDBqZWJX?=
 =?utf-8?B?bnBka0NVaE1VSzY4RVUvaXBYbGdkSmNvdDF5dU83UEtiUG11aHR5a3VwOSs0?=
 =?utf-8?B?L2M1dnhlSy91MHpDdFFLOUwvMTdrcVU3dnFscTFpbHZacDlmVHA1dlAwYitp?=
 =?utf-8?B?bUlzaGpPbkduWHZtY0tLdnpkc20rV25Nby9BQmd0dGJvUzZ6dFZlZTJkdnZS?=
 =?utf-8?B?dFVmUk9Edm5Ud1gyRWlhVlVqQmZQc3RHVDlZM1Ntbm9UU1lOeEIrMWlNVkNr?=
 =?utf-8?B?ZE40dHFDNjJ6SVpXK0FoSllFSitiU2xjaGZWMmVzV3VpckRNUGFoWHJZYzl3?=
 =?utf-8?B?d1dmNWkybzllTVl1OXAzdzh4NzBremNBN05MSEI5VmpBRUQ4RDVXd2hJbm9M?=
 =?utf-8?B?WWtYeXlHRjcydFRoMVc0WEQ4YnIyNWhPcncra0sxVVdBbnM1UjJoVXFJYndZ?=
 =?utf-8?B?cSthZWZZQ05nanFva1kwemluZERVUWNPYmowalE1TVlJNFZGQWFJOUZPSXZU?=
 =?utf-8?B?Sk5weDNyK2hZMExiNGRoUGlwLytRRWpyM3IydkdObFNhMGJYOUYrTHFJWDFj?=
 =?utf-8?B?MTh6bE5aQXUrRjFQeElIU2lmaC9EWnhSSDFNWFd2V3lJc3k2MTFJdjh2WnUr?=
 =?utf-8?B?OEt2VWplUytEQU94TUZaVitkNHV6VHlRTUlFcXhCQklQNXAzejltS2FVZUV6?=
 =?utf-8?Q?bbFJFTpvhFvFNrwjqpXwMkq/RiOydrbBHWyAc+g?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a59b1e-93a3-4d1c-3485-08d8ed170a8a
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:44:09.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13W0OUUXTnhEGUlDMcjuhQsL6PKAp/iKAl+trTbUR458Psz2SIJLOiIJkJpf5sozF+qqHOoI7Es7BJJsBXumZZxXeBmmAgAB6EzM85zFaNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2039
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 3/21/21 4:08 AM, Laurent Pinchart wrote:
> Hi Quanyang,
>
> Thank you for the patch.
>
> On Sat, Mar 20, 2021 at 04:37:39PM +0800, quanyang.wang@windriver.com wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> When insmod zynqmp-dpsub.ko after rmmod it, system will hang with the
>> error log as below:
>>
>> root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
>> [   88.391289] [drm] Initialized zynqmp-dpsub 1.0.0 20130509 for fd4a0000.display on minor 0
>> [   88.529906] Console: switching to colour frame buffer device 128x48
>> [   88.549402] zynqmp-dpsub fd4a0000.display: [drm] fb0: zynqmp-dpsubdrm frame buffer device
>> [   88.571624] zynqmp-dpsub fd4a0000.display: ZynqMP DisplayPort Subsystem driver probed
>> root@xilinx-zynqmp:~# rmmod zynqmp_dpsub
>> [   94.023404] Console: switching to colour dummy device 80x25
>> root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
>> 	<hang here>
>>
>> This is because that in zynqmp_dp_probe it tries to access some DP
>> registers while the DP controller is still in the reset state. When
>> running "rmmod zynqmp_dpsub", zynqmp_dp_reset(dp, true) in
>> zynqmp_dp_phy_exit is called to force the DP controller into the reset
>> state. Then insmod will call zynqmp_dp_probe to write to the DP registers,
>> but at this moment the DP controller isn't brought out of the reset state
>> since the function zynqmp_dp_reset(dp, false) is called later and this
>> will result the system hang.
>>
>> Releasing the reset to DP controller before any read/write operation to it
>> will fix this issue.
>>
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> index 99158ee67d02..bb45b3663d6b 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> @@ -402,10 +402,6 @@ static int zynqmp_dp_phy_init(struct zynqmp_dp *dp)
>>   		}
>>   	}
>>   
>> -	ret = zynqmp_dp_reset(dp, false);
>> -	if (ret < 0)
>> -		return ret;
>> -
>>   	zynqmp_dp_clr(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
>>   
>>   	/*
>> @@ -1682,6 +1678,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
>>   		return PTR_ERR(dp->reset);
>>   	}
>>   
>> +	ret = zynqmp_dp_reset(dp, false);
>> +	if (ret < 0)
>> +		return ret;
>> +
> This change looks good to me.
>
>>   	ret = zynqmp_dp_phy_probe(dp);
>>   	if (ret)
>>   		return ret;
> But shouldn't we call zynqmp_dp_reset(dp, true) here ? Or rather, call
> it in the error path at the end of the function, with a goto label.

Thank you for the suggestions.

zynqmp_dp_reset(dp, true) should be added in the error path, I will add 
this in the V2 patch.

>
> For symmetry, should we also move the zynqmp_dp_reset() call from
> zynqmp_dp_phy_exit() to zynqmp_dp_remove() ?

Yes, I will move it out of zynqmp_dp_phy_exit and to zynqmp_dp_remove() 
in the V2 patch.

Thanks,

Quanyang

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
