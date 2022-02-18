Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D24BBD26
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C699710E43F;
	Fri, 18 Feb 2022 16:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1788710F040;
 Fri, 18 Feb 2022 16:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIxqJS+ToVltEiihLSqoHGGFTtv+34pP2832eD5ve1ACJQUbG4FtIOpwlVBVkAvwmd1MjBnA7E2x72dic/nblj1oCUWFft0LXX/mYKE7SAOua/I5T3MR7iXcFoofZRlxVza8zlH8kcGqP9VhvIpsVKQI8cVacnGzPMlboTQGj9n0zgURLdEFn8psTjY/38LJIAYOGe5dpH37fr1s06DKq9FelR/AbWw+PSYEw8DaB/IrhtViD17laR4Q4y4a7wclaAr9VZsAsVhoM6n/s+yw93awxEg0KR0smXK35l8SiCXN+6KVZHRk2le+cmws246jCDbzV87fR/RPl4kmx1zmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0in2qx1ixxnOCnY+Z05DioiinnRyU1HcfmP6Dhxoj/Q=;
 b=PlNc2ZzBVUSLyGwStsLtkd1/0P/iM+qr1G6/HF8WDMtX6DOb9PwIZNGkDaoraxr6olQX5h5Jk1olouox4ijkj87JBFY0l/PKk/Py3P9Kd91b7AMNw2Wx3xJdME48OFyGuq1UyxV4bAtWsZglE2Xhee+csz7Lt/aOZwrZ6CNIjVACMgfrV0S7kgBYPkZ4jliHHtb21QPf2nSwQFv/CXMqUujAvnbitNf4NQk34+ViY+AizeoAhQWrLU8bXTTeW7zmiPcny5XiZUU8OFGHR3rGLD6loPTfcb+8PXqhJ7w0jKY20hc6E8ZTzfxMVUwjan+jcxd1Orclmo5WREmsv1lJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0in2qx1ixxnOCnY+Z05DioiinnRyU1HcfmP6Dhxoj/Q=;
 b=cscR0/IL4DVpyqTCRjjoQ8f2IrXLEXi02d1wemLJlv9qMFISCe/7Di/OeF3CqAbK4hKDJVe3/B+mM6De4TI0W3ez+FaIhbfG/ocS7zgEWip5yXWINQkaa+hYTF5qhn8/OHVjmqYO7gQk/xbsP7D8/YEPrUgw3sfaSwU+7sf5Jh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4534.namprd12.prod.outlook.com (2603:10b6:208:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 16:15:08 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 16:15:08 +0000
Message-ID: <ea7d5e53-c008-4833-a24c-a17522ce96b5@amd.com>
Date: Fri, 18 Feb 2022 11:15:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Replace one-element array with flexible-array
 member
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 cgel.zte@gmail.com
References: <20220218030943.1905838-1-deng.changcheng@zte.com.cn>
 <cbc80795-af46-21fd-dc9f-ce932be76d4f@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <cbc80795-af46-21fd-dc9f-ce932be76d4f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11e0fe99-6c2c-4f00-60f4-08d9f2f9d4c6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4534:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4534A29C5DF9BE4BD11CE39392379@MN2PR12MB4534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJyYLxmWsxZSh1/dRXK2zO4H1YGFLEBp76hPqsg4HPOJgHt87ho5bPq3d5XLf1LML/UrbIYDbheAbziwvOwpC5RiZT929mVkG3P+EAh2wWzo7WU42+WPK1d9pzRoxgp6MAPfU6pmUA0y9zlwTnG5eqqbwA02ygG3PdKIvwmEqkb0R2Ct79xILwjU4aUbzrDq2qg6PWGmmhtXDEu7TVDkYe/Th65jK3Irj4s2MqxuleXiYmoiOQM3lAq46XN9QBsIY4Xhr++dB1Ml7sVm7NenTDWRKqfMMSJdanADrO6y6zPW6y96QtKj7Bj3sFiAB+tGMatB4fbYaUQzWLsOJ2emmgSKbDOuqobc8j0ZTEi35uQoripnxBtkBg1vB7026OosKrkqAgeeO0l2cDHRnntTINpPo8iUOesOD6NhrdGZ1X66AcZjIllWPi5NxtKCUPsXxzR9ObS0Vdy6WHFRoYGMnGieCP+O1AO2vzlEfUGTzncO8XoZ/IO4yOT/tBfWVdbKv1US4J1R15se8SVHl7CGSh+NHCycfgEZWzAUJI+9aEaO6s5Osnd5jsqLOyChcdhnoOWjaTrnuGS3js9yfgnt1AtCUgF8QF9qNyPCnLeii3NMp0knd/dF+a15maCR760tb4/TGHxd3VMymbFSB8dBx7D9x6Oii4yGT8FTdlBPHx429RZ1aRStXr1Tsvy+O67/eXUmG9nDjIv+4RewUPd8sZQGQl2X9/snVA06uobhhTpxvz4z7ynLx2cJWkS7ncWu6JXaIaPrlB/d/czSLq5az9gOtq7JZ/hrk+F/apt0zVAAyOgUe6FRW6x5gHHqscTG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8936002)(36756003)(66574015)(38100700002)(31696002)(86362001)(31686004)(6506007)(44832011)(2906002)(186003)(316002)(26005)(508600001)(66476007)(6512007)(54906003)(66556008)(5660300002)(8676002)(66946007)(966005)(6486002)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2h4aG16VGxIczhUUzZmL29STzg0Wkt1RTAxV1o3MFJXRXJFM3JLMEd6ZHBp?=
 =?utf-8?B?dktSSzViS1l6TjI5L0IwQjkxNEJQK25VWnQ4ZFIrb3dLL2JwNEdnYXFGNGVu?=
 =?utf-8?B?cjZyQU4zeElPVE1zc0l4VXJ0dzJuVmgrZ0V2L2ZBd3FOT1FzTmFIYU5TZmlM?=
 =?utf-8?B?UWhWUS9jZnVKRElVbTFxRXFRdTMyRDBVU3NvYWNRdHlOdnlvdEpGZExBRFdC?=
 =?utf-8?B?eWovZWtSbFZIOHZVVC9FbEhMZUcza1FvRXVPZHh4cS8wUlpKSlA2S1lTRGRk?=
 =?utf-8?B?VE9IVERuVnV1aTVsWFNZM1ZJT283OFAzU00xb3FJTTFHNU1yVkN6NlVJL3pJ?=
 =?utf-8?B?aGlhblVEdDZzVnFIYVlaVjVzaHlxSTA0UzJ5MGliR2VPeUVNWVM5OVJBTGFB?=
 =?utf-8?B?OCs0TGpLbk1rL0NCWUsrQ0RFNUJIY3dKbGpJTEd2NTJKM2NJZk8rSDN1YkJM?=
 =?utf-8?B?NmsyeXRNakQ1aEZSTDJ0ekpvQTF1TWQ1bHVPR3c5dUo3SUtqeDVJSStOQWdi?=
 =?utf-8?B?Zi94VE5qbG5iNysxamI3QkN1a05rclZUSXVpbENJQmxQN0VveHVORy8yemF6?=
 =?utf-8?B?cUZ6VktIZjRHekl3cHpRc3dxb0FQM1BnNm5VQlpqUVI0b1RhcW93WS9USThr?=
 =?utf-8?B?dSt6eVhhMEtJQmplVDNmMWxEU21mQjFYWmZCaTQ1blRrd2xDbWxVUEFvLzlM?=
 =?utf-8?B?b1NnTjM2MDhUaGFQUVg2Sk9QeGZrekVJajAzV3d5RXZaTDZ5WTZQZHhUUCtD?=
 =?utf-8?B?K1hCU0RoY3RyeGJFdjlsYWc1bG9MbStVKzcxa3hiMXZnNFdBRk5Qb0haazVY?=
 =?utf-8?B?WGpHZTlLU0pMRFFhMjhtc2lUUmx2NTgyb0lXb09qNVRkKzAxbDZOcmFYZkZ6?=
 =?utf-8?B?YTBLTlVBY1dTYW5Tb1Zjb1B3RzQxK2JISnQzMlIwOHFOQTlTNzgwdEhtVmgv?=
 =?utf-8?B?b1J6d0FiNG1rc29DdStTaUVlN2FtQ1EwNFNUN2p0WUhkaTdRdCtweW1FUWh3?=
 =?utf-8?B?dnpEeXJTVW5wVDN6QUxIU3BjZFo2ekpZaWxHWDdHYVJTQW05eXRRUnM5V0VY?=
 =?utf-8?B?YitxVVN0ZU41bzAvelRXNS9NYU0weFNBRWFnM3YxcU1IclVqY2oyc2xlaFdu?=
 =?utf-8?B?OEZHaWVvZXY1d3o5OGxzNWxjSnR3NHk4SUI3OWdvM1pxWS9XcEVMcW1RQnVu?=
 =?utf-8?B?NkdSd1VmNUNIVyt4UGcrRmpYYi9ZWVUvM0Q3RWUzYm1JdHNqVUVDYjRrd3Vj?=
 =?utf-8?B?Y1BwY2QvM01vdkl4WDlNME1CNENCQTlxNzFHOWFqVG56WndBS0FYNWxVRWdB?=
 =?utf-8?B?OVN6WWNMSDBBNEpTMmRjMitGeFNZWVVtcjNrVG9zMnQvbklDRjFoUCttSDdK?=
 =?utf-8?B?TGZhbVNGd1U0Mnc0L0tNL0x0dUFUMnJRTFB3UW9qaHoveFBoZHNnS0FyNzFn?=
 =?utf-8?B?TWhQcXBjUDJGRGFXaDVyd2lXUllIazU3dWcxZUQ5Z1FmV04xSDBveGRidTFI?=
 =?utf-8?B?dHphNXJSeXIreTcvVGdPOUJZanIwR216UkZERDB3WkcyWjN4K3NSRlRqWkc1?=
 =?utf-8?B?ekhUeE04dm5WMzN6QkZNR2hNdnprT0l3QTFJZEJWL25lNzJjWWtFTzUxVUZ3?=
 =?utf-8?B?VGQ5QTAxa054M2dQQkJxWjRJMm9PNCs3K2lsOXNBaTZYeHRTY2ZCS2RoRVIy?=
 =?utf-8?B?Y3hPMklkV0hRZHVjSTkraFo3dnNPMCtXVjc1YUUxVWlQL2pRNDdVd0UyTFB6?=
 =?utf-8?B?eUhBU3E3andzSmo1RGJPazlWTUQzKzFEOUNnU1cyc1ZLREVGTUdlVjYwSmdr?=
 =?utf-8?B?N01IdFkzd1E1bVViTFduY0wrSCtWUWlnSnZ1bElyYUtXQi9LZjlxeC9ubDlJ?=
 =?utf-8?B?NDRKRHIrbTRiK1RQc2dCOHFoeW1KVWJKdGxiRUtRdUxnS2p5c2VpMDA0NDVo?=
 =?utf-8?B?OHhxZjE5dkVlUmhFd0dDWFlqRS92dUZEai9TVTVYZVgxc1BON216cU9wUzM5?=
 =?utf-8?B?WUJzSmZ5aEsvT2dYR1ZJTDBlNnV2L0pwVzFTRm1obTRzZStLUnFBeWlnYUFL?=
 =?utf-8?B?SWpwM1djRzZpdDNEcGhCdkFPQWFBK1VRUjQvUXJ1VXMxdjFvcnVJWFBWeVQ3?=
 =?utf-8?B?U25CcERpWnVKTk1IZ3JUNW5Gd0FHay9CcFhxQW1WMk1xTStJaXVNdENqZ3lH?=
 =?utf-8?Q?IC22xooD2ZyxEcVO7kQLskM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e0fe99-6c2c-4f00-60f4-08d9f2f9d4c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:15:08.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+a4frzXf95jNmfI4AZFkfCPTfCtzN6VNQWrCWZIPxMlKrKlKj2vjPSpqoOAWP2283nZ4SPBOxZGSMRNkNnblw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4534
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like this structure isn't being used at all. So I'm OK with 
this change, in case we ever use it in the future.

Regards,
   Felix


Am 2022-02-18 um 02:47 schrieb Christian König:
> Felix need to comment as well, but I don't think that this will work 
> that easily.
>
> By changing the entry from 1 to 0 your are also changing the size of 
> the structure.
>
> Regards,
> Christian.
>
> Am 18.02.22 um 04:09 schrieb cgel.zte@gmail.com:
>> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>>
>> There is a regular need in the kernel to provide a way to declare having
>> a dynamically sized set of trailing elements in a structure. Kernel code
>> should always use "flexible array members" for these cases. The older
>> style of one-element or zero-length arrays should no longer be used.
>> Reference:
>> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays 
>>
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_crat.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>> index 482ba84a728d..d7c38fbc533e 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
>> @@ -310,7 +310,7 @@ struct cdit_header {
>>       uint32_t    creator_revision;
>>       uint32_t    total_entries;
>>       uint16_t    num_domains;
>> -    uint8_t        entry[1];
>> +    uint8_t        entry[];
>>   };
>>     #pragma pack()
>
