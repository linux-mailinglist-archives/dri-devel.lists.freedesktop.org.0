Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DB527E6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66210E4B4;
	Mon, 16 May 2022 07:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298F510E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 07:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSpt5RBp6tnjGkLlYi53AKYlUuhcV5I3R5aadEtr0nDQdFxf44Mg8OQiYpKkD8p6JnqH6INGmmWbkKsHXodcEVjzMXyVIuDjok/7tqOeJ3josiURtnEEWhUnCGTEF8+NhgaxnY8wWsN7EN21T2ifbewN10qxZw3GBlq6CFvQLOM04A7YqC2L9r+CLGX7TCGY+vBj1+fIIEESioZSS/21tvlhdAgs70h3Nv8U/f+cjFEhngTB79SX4cdc8c2oYx+dEoywJHqOpP7ZApp8wlWPOc8DR3f5qLk15x24b5H6sPT1wMYC5FkExs54dlezRFu+tNwSdXZh/BPm0INa3yQeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcSthPGQfw3mZLIXlRoudAKcafaHCz9bdZY2BBKowak=;
 b=oG5E1GOim+jnrTNGWwzKZ0FBTPRDgzwFULMAVCvUUq0UUxPmN9XcENmFbEErsuVunYcM44WQgawleCizOY4YNMWLX+LxmGDkZgZzva1SP1PX/ib4B9DwlqyQd4JeL/TrASr/X9zkZjBOpFiTgn7Liv/XkgCH6zG6hRqNTdMx1GPwB4iHn2hpCcIM+DYBEJjK0TcnJhJcBryBUgoXZrSY0ZDa/Wbahz1bbZ0bUVA7QNpgt0i4fMrQBgLFS9DEzBwrZmHNunjb9xVUoUg9JEkt+xB250lxcD0dSzjuZVRExotkdtHJu++HslhHxt60fSlQJ1OpQpbb+WgMq0vKYIAFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcSthPGQfw3mZLIXlRoudAKcafaHCz9bdZY2BBKowak=;
 b=e4Y8vmluZ8FyGPpKlqkh/8fJGNTbKwUQaA2efItmFwDafRMA2IJwGGekOpBABUVWZlVCCFgf2yCpTph6Fb2YRgskNetmEOpAQ1BqgQsMOK45GcNMQYqyJfI/u4sJG5PIQJ4qWOVHVuaZkdsayA0W5nUdqCnKXSuTsM9Twe7/+XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1434.namprd12.prod.outlook.com (2603:10b6:3:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 07:19:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 07:19:00 +0000
Message-ID: <796f913e-3b4d-23dd-e3d6-d1acd840ddf7@amd.com>
Date: Mon, 16 May 2022 09:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [bug report] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <YoH0AcDvgowmOot4@kili>
 <779aaa3e-45cf-6eab-23f1-bbbc0d3f0c69@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <779aaa3e-45cf-6eab-23f1-bbbc0d3f0c69@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0166.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79060c6d-a820-4a88-627c-08da370c5968
X-MS-TrafficTypeDiagnostic: DM5PR12MB1434:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB14346C58BBE041C8EFC62A7983CF9@DM5PR12MB1434.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ql5YJttGKaJ/dXpFdAscn3fGGW72p7AB/SCF9cyWCXCvFYCaIolE1l3C9sSsv3I5nhCXApnsV/+llqiBX663KJlmOi6kznGFgKdZWGDxOlqnFNCopGKwRJMVGDNSjzNPBtP40bS9txwz/ZwUa5r66u3Jq9pmA4P6WpFDkdJ9ad/q+XakQmJXqMCsp+J3t+irq7De6ops2M7MW0GEGWVfrKoUeLNsGXPbmHthip6UhowLkZMxzBBwJ3IA3JSOWfn7U8IgsRPQhm9U1Hw7rWdgYDlngRN1UV7GhDShsMcOcB4m/VrO59t2tN9hLisb4GuyllEFUG6qjyRCbqh7/eN2ZLL4faO4xW544mBG9US/Y9khoFpWjZdw15VFMB9JwLh08SUuxR2/JqzQkR1YO1ztaH02UQaA2N8b00WFyOcO2hqnQUYqoya48W3SWsHuWFyOPUiLctRRsi6/kQdAHjG8LO6cRGQbZbn82KATnl06/CdWS6q4xm48FNeQUnPhz/2HMIhqwcFdTbdrkPv3qQecQbK8krG7Lm98I9OJKpnbaIw4uoy/RPtn/isLHUkSX7Cmhmjk3lBHoQNASRU7uOfaoUdvS75qNLvjVLT60QOJ8NI9Kw8YTlolKTo68DZsrbNu45E2a5Jn+YFWViT0IIl6BZGQQYgCiPswgOKefoiAfkS5aBiTM0wm3qhU/fI1+jv6URlVJpeI+k5MAFpnImLzfKVtDrhV+Ao3LI8Ijad6z1SXWH27ofQ4AnL4J5O+InBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(2906002)(6486002)(66476007)(86362001)(8936002)(36756003)(5660300002)(83380400001)(66946007)(31696002)(4326008)(8676002)(38100700002)(53546011)(6506007)(2616005)(186003)(6666004)(508600001)(66556008)(316002)(6512007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFXOWxSeTRBNG00NTlzQkJ6MWZDN3g1bEFESytjUWdyYmJRQTM0a0RQNUFy?=
 =?utf-8?B?RW10OWIrY2ZBVW5NazlDdDBETWU2VTFVMCtwbzFaVmU5OHRCNmxvSGc4WjRB?=
 =?utf-8?B?Vzl1OUFMcFdKNmJhR2pZUlMzZzl1bUlJbHJnM3hVQzRhUThmTUxuVzk4WDNa?=
 =?utf-8?B?aStWeFJuWDY2Q28xdjc2b1ZYVXo1NHNldXAwVkQ2RFJvNVpWUDFlS0p3TjZJ?=
 =?utf-8?B?SVFqRW9nRFUwUk1SWHk5ek1pT3YxVGFWVGVuQkJCd1c5V20vdEVabTRkeFBr?=
 =?utf-8?B?ZlpUQlFyT1JqOTFMWkZ2QkE2UENPRHVUM1gvOWxzWGd3YkUvNzJrazlrSWhE?=
 =?utf-8?B?UXgwZGZRQ1IrRXY0VkZ6Y0pUOEdYdUYzYzZreGovL09hM2RzSEtFcFA3aHRm?=
 =?utf-8?B?K2NveDRLT0hxcktPcWJvZnNua0ozMW9BM0JsT2JUYlBqOFgweGZpdzlXL3pm?=
 =?utf-8?B?ekJyRldkU1UvOXFldCtMN3ExNytmaldULzlXTWZlbk9Sc0UweUU4N0YrTWRW?=
 =?utf-8?B?Y2pnQXRmeFlsY29KMElkbXJ2VjJDMUw1OUpXWFZTeTU5NHhiWncvbGdXT2l4?=
 =?utf-8?B?Z0pubVdHeS9HT2JyZks5dnlEVFFFTm9zQnEyekczalp6M3VpK20vdkpjUURh?=
 =?utf-8?B?V3RvUmpKc1M1Z29yNllsS2hOb0U2b2ZQZUFDMmJzSlFwMjEzMmdjcDE2bHVB?=
 =?utf-8?B?T1dqZkd1WXVFMjhaWWhnUDlCcVFsN2kwUUNiTmhka2V4MlMxYktlcG1FUDJm?=
 =?utf-8?B?Mk9aRzB2dG1NN3JZUnhFSVFOTmsyNmZTVUdVUUtkb1diK2tReWJwakt4cSts?=
 =?utf-8?B?cVhpR0lrTXZTS09sNU80MGVURTNiYUhHK2g2cHVaR2FHcFRycHcwbEVJbm1n?=
 =?utf-8?B?b1luTFI1MklBZkpFQ3hkRytoSUE5R0FpL3BIby92eTU4N2dMK3JvbFc1YW9p?=
 =?utf-8?B?SDJ2M1RlQ3l6RnBJbTk5OFBTNUQvb0RCUHBDZGhIT2IyVVo4bC9LZ0YyVEZ3?=
 =?utf-8?B?eWJld0IxVzVtZFJJYWVCY2pJMVVjUnk2OHdjaUVhdkpndGRRd05UamJXTEc3?=
 =?utf-8?B?b0I0TE5HaEZCNTJFejdpMytWTDBXNjNlanRQcDd3OGwwK3JQNHhQQk44VlNj?=
 =?utf-8?B?UkxSaGo4ck5YSzRMcjlPK2Faa3k0eVFrUzJBaUdqbVY2bFRkbVg1Sm52RStC?=
 =?utf-8?B?L1JtZlNBRWdmTnE4S2lEVmRZVTNyanR5VGRGYVRXd1JKYVNuUW1oTHFTNFNr?=
 =?utf-8?B?SXRVSUREdG9rQjVsclN5d0tNN0tWbGdBNXlsRGlqb0dSOWprSjFDRnA3alR3?=
 =?utf-8?B?QVprUiswQUlmc000U0lSck1iMWxHNmVKS0tpemYwelZmYU95OEpxcFRkOGFk?=
 =?utf-8?B?a0xEdDFBN0lIeXlrQlQ2V0Y5ekpzcnpST01HdFZLdmh5bVF5eUp6NEJsM0d2?=
 =?utf-8?B?N2Z2Sm1WN1pmWFFpbFdpUjVHMmFZcTRUeDF2ZlZtcWJ0Z1R2c0RQUkhqbFJp?=
 =?utf-8?B?Mng5d2NvRDExdVFYUlVQQUFsWmtpaXpXTWlVclhiMzdOMWlLZVhNSlBTRUQr?=
 =?utf-8?B?UzhvbGNLZ05VckVFTHRGUXMzOSt2WnNJTEE0YjFPVEpoVlZ6S1hqbzY0eGhZ?=
 =?utf-8?B?dm91cWRkbUc5ZkxEeVB5SWR4d25DSGc5dmhNQjkweGVhN210UDZHM2dMdk5h?=
 =?utf-8?B?aFNHM0RSZkZJbVJxUjVpTEo1VzFueThMM3lvVG5oSzg3T3ZXajdvbWxva1VE?=
 =?utf-8?B?anJGbTdWVkJjbzNWbldLZW9KSWdqaHdSSXd3TkNrYmRkUnBhUGNqaTRKdUM1?=
 =?utf-8?B?amVWaWF6Wk14SGdicGhTMGN2RmFhamwxRXIzdkJoQndzM1l2TDFlOWJjank1?=
 =?utf-8?B?b3MvNWs5NHRXeXpqczVudngzZTRxc1VGNklYR0NCK1VEMG1uR1JCRDM0d3NL?=
 =?utf-8?B?M3gvaXRnYStoRXEwWUIvVFdQUk53am5KazZrbUVMMkJiOTZsdS9zQU5WY3Bz?=
 =?utf-8?B?ZDhCZWxFR2M4em9Pbk4vY0t5cDFFQkthUk5OQ0RVVURZTVRyWERlYzFTbGJt?=
 =?utf-8?B?enBadWo5RThZcEMzV0RqaVRkeWFXeitYMWFQRytaQmRFNzh0TUs3MWh0Y3Vs?=
 =?utf-8?B?cFpoS3RwOCthQ1JvVEpsdDljOXBLNGtpcVF3blNmam5zNVoyV21sQk5qV050?=
 =?utf-8?B?RFNrQWRVYzhOUzFrMlRCTGY2dDFPTDRDYUNRMGFwRFBySW9PWnp5NldLUTJO?=
 =?utf-8?B?ZW1yM1ZoRS9SbmkyT3JtRWxoWEI4d0xtZ0lkbDVmbU84Rk1ESCs0a0xBcjhJ?=
 =?utf-8?B?MjQ2cHFKT3A2MDIra29FbGxIcG9wQXRTNWttYUNGaW4wZTZBdWNrNjFRQ1ZN?=
 =?utf-8?Q?V24I6LYG51x9D1K937mfUQszAfv5pU7m0O7sWbBWq4Qk8?=
X-MS-Exchange-AntiSpam-MessageData-1: UguhX17kHfassg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79060c6d-a820-4a88-627c-08da370c5968
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 07:19:00.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EL0YoBiVtTZvNGHZjjkDIo3GHTqNP2y4tBL/ppsaH0SIg1Cw6E1IjFwV6CcXgfuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1434
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
Cc: "T.J. Mercier" <tjmercier@google.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.05.22 um 09:13 schrieb Charan Teja Kalla:
> ++ Adding Christian
>
> On 5/16/2022 12:19 PM, Dan Carpenter wrote:
>> Hello Charan Teja Reddy,
>>
>> The patch ef3a6b70507a: "dma-buf: call dma_buf_stats_setup after
>> dmabuf is in valid list" from May 10, 2022, leads to the following
>> Smatch static checker warning:
>>
>> 	drivers/dma-buf/dma-buf.c:569 dma_buf_export()
>> 	warn: '&dmabuf->list_node' not removed from list
>>
>> drivers/dma-buf/dma-buf.c
>>     538          file = dma_buf_getfile(dmabuf, exp_info->flags);
>>     539          if (IS_ERR(file)) {
>>     540                  ret = PTR_ERR(file);
>>     541                  goto err_dmabuf;
>>     542          }
>>     543
>>     544          file->f_mode |= FMODE_LSEEK;
>>     545          dmabuf->file = file;
>>     546
>>     547          mutex_init(&dmabuf->lock);
>>     548          INIT_LIST_HEAD(&dmabuf->attachments);
>>     549
>>     550          mutex_lock(&db_list.lock);
>>     551          list_add(&dmabuf->list_node, &db_list.head);
>>
>> Added to the list
>>
>>     552          mutex_unlock(&db_list.lock);
>>     553
>>     554          ret = dma_buf_stats_setup(dmabuf);
>>     555          if (ret)
>>     556                  goto err_sysfs;
>>
>> Goto
>>
>>     557
>>     558          return dmabuf;
>>     559
>>     560  err_sysfs:
>>     561          /*
>>     562           * Set file->f_path.dentry->d_fsdata to NULL so that when
>>     563           * dma_buf_release() gets invoked by dentry_ops, it exits
>>     564           * early before calling the release() dma_buf op.
>>     565           */
>>     566          file->f_path.dentry->d_fsdata = NULL;
>>     567          fput(file);
>>     568  err_dmabuf:
>>     569          kfree(dmabuf);
>>
>> dmabuf is freed, but it's still on the list so it leads to a use after
>> free.
> This seems to be a false positive. On closing the file @line no:567, it
> ends up calling dma_buf_file_release() which does remove dmabuf from its
> list.

Yeah, correct as far as I can see. The checker just can't see that the 
fput will cleanup the list.

Regards,
Christian.

>
> static int dma_buf_file_release(struct inode *inode, struct file *file) {
> 	......
> 	mutex_lock(&db_list.lock);
> 	list_del(&dmabuf->list_node);
> 	mutex_unlock(&db_list.lock);
> 	......
> }
>
>>     570  err_module:
>>     571          module_put(exp_info->owner);
>>     572          return ERR_PTR(ret);
>>     573  }
>>
>> regards,
>> dan carpenter

