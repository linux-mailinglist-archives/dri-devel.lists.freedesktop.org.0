Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6524D73A0
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 08:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F13710E0B6;
	Sun, 13 Mar 2022 07:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC09710E087
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 06:06:07 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22D4W7pS006929; 
 Sun, 13 Mar 2022 06:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=njVoVrV8drscjK2sWowtnc0TYy2yfNEYvwdtwBaYuIo=;
 b=TBCPAEZ975+G3VRfEDFXyLHt5qHbpt4yw3KQiZhhqQpjGiRbaMe8p1PZFfI+IlaLarx5
 2WkRWeDy5ZA0BihcUrc4sL5zX8/Ulh9D7S8o+w6uDKiuMevujmWM6yCOf9B2L7z1SQmB
 KCfcoUATpJrnlzXnSTN5C/QRtF5JfNFMD2zUXyTe3X4FHml3q9JBTVh9OFVP57qF/r4D
 SYzlh4x6Ue38IO/W8NoGEUvr7GPYVQuCzqVpr2pqSdWAqVv38PIyNNHOC1e4Gt/wyCbX
 VDgYwWtjW8RdQzFM+AntoMgBBD0ah+sqtamuVKyzDlI40zeu0VPNQJcc/SvnKe7858cy ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3erhxch99a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Mar 2022 06:06:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22D5wUBj083178;
 Sun, 13 Mar 2022 06:06:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3030.oracle.com with ESMTP id 3ergmrjw0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Mar 2022 06:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPLb5azViNcFmvz5JR0/E0vQHfrGocrH2Pge8R4j7pHTlLr9JA48aFNCCCJyJ261xC26loOPbC9p+86xW1X8+qzvR8gWN7cDBA2Si48EA+U90os49ttifKIHHORV/tuDl0WkAhNFN5+dw37qzQn5axoDUwXzCu+2FEIrCH0Ls/Ij0YTNlFdSvxeQT7OtgNvn9LGdZaeJuGTze4Tr2aHy8Jsk4tycphv+eBLUk2E/46wHsQgyuX15h21QccjZgIzb5Y53NqGNUqZbaqWPUDmOhcgJF4OD3iCD6VNYmHC2XAYzbF3ile6TLZriq0O2QdUMrs28+kQUbNHZojj/Fw36vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njVoVrV8drscjK2sWowtnc0TYy2yfNEYvwdtwBaYuIo=;
 b=ZWYjamRZJ0dnliDKcWg+esM8oqAiXSGaAC5Lml171ClT4HeE8jKBAYSgvUC4WOzzZW+k+8ezdudt60H0V3xvkso8Cc/rpKrEZpT5WUf3gRThoT1EOAfjwMPmz6bVPt7BZZUI1H714zoM5YnLMnNvwPtwMgI7L/7FayflCa81EFHkLSElQ4p5FvbeebT1DIvcBE44VY2v4xsfWlJQAcCo4oCb4/lliIsEYlYMFwJPDcptO7GIh/8uNtT5l47GxQ/B4C2QLoPDAPCA05NXNYeRk90IYpD4oPhTHBgLiIQpkN6wyU0hpUhzGveFLGvxlMWMGiadYLiuU8qSiwRo0g8S+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njVoVrV8drscjK2sWowtnc0TYy2yfNEYvwdtwBaYuIo=;
 b=0FRWXEHibNATIbTcsvOwFcM5qqBcbq9fBenO1UUQEVIBva9ok2hXlWcxW2luz3523ZBqFGS5VQioRbxN+/LjCcfAWqPv98Bu8oDkfDfM67qvZaNJKDQg7aFkn0eoeOFqotoQbK/JibIX6+55W5GvNOe/PlctiPuzQYBWEwAAG/Q=
Received: from MN2PR10MB4191.namprd10.prod.outlook.com (2603:10b6:208:1d1::14)
 by DS7PR10MB5263.namprd10.prod.outlook.com (2603:10b6:5:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Sun, 13 Mar
 2022 06:06:01 +0000
Received: from MN2PR10MB4191.namprd10.prod.outlook.com
 ([fe80::cc0c:ef95:62e6:8709]) by MN2PR10MB4191.namprd10.prod.outlook.com
 ([fe80::cc0c:ef95:62e6:8709%5]) with mapi id 15.20.5061.026; Sun, 13 Mar 2022
 06:06:01 +0000
Message-ID: <bf3cd367-81be-a72b-6f23-14005f308a1d@oracle.com>
Date: Sun, 13 Mar 2022 11:35:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/v3d: Use kvcalloc
Content-Language: en-US
To: Joe Perches <joe@perches.com>
References: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
 <05dbfbd2670e2b28229d0ab96c1bd99787d4a187.camel@perches.com>
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <05dbfbd2670e2b28229d0ab96c1bd99787d4a187.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To MN2PR10MB4191.namprd10.prod.outlook.com
 (2603:10b6:208:1d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c16b56-3217-4efb-ca9e-08da04b78c77
X-MS-TrafficTypeDiagnostic: DS7PR10MB5263:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5263919A30D3FE25E5ED0A7BC20E9@DS7PR10MB5263.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQAo0bNaq/GZiQFbsJsmF2UiR8VMGQJ9u5apq6o9ngjnrd6wkIMiLoZrl+vrhe2Tp44gnOEpH8hKaQHtbAyJ2ekxohmNYY1U50bL4komclzgrlpEVsBmIVb4tMvr2boC+8tRgXuzUqYsBRzK7s/Qnk1r85z5JR2w1noBe8WMVGRalSe8MDWBcL5GR2coaGeYU2QtyNOU4wphGY3B6O1wdpgXiEHEFv1R3eLEdRdi+bPm9OqSBjfxEdvzkio3LNL/4jjBen7o/F1BYSX6QND7RTV9+z56eyhzacWuBnjVxZ5XklzyEklNbxYWdySx3agXDOKHw9d8oYT4VgoAuZIRqaAzwPpw+6O4xUqOcMctDWF2Ke5b7QcMGX2r0rb4qWHwJVSp0tDbQp8YKkY1bcmtQBc5ROqBVK6qu5MEiZVt7ulmn4g08nj7j8bXj8zb1dCAVBDil4nJXI1Sttqc3u6PpRfjTFW4rSmMw7kidZdZz7Wsnu+u33qgLFjBRF+MPK+MLfrUUQNzkdGnIltCSbVEPABALFwpyPm+nbfyjLS5iC1ZPKgykYNWr8T0rwr9mJmwm1XnhclkLmQHt3ArxSzo3s0fieTPZ/l/HZxtBOCflDb6PaPXnrYuayg6AzqAkvAefUKYGf/z7iaIYOKBz3JSebjUO786rqIjCAPrYKUZ7bG6/k14ZL04fjG9uWlCIbOZOnhQOwdbzRnFe0U+hEUpi9pVfKQSxpNiNHcUhJFPVL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4191.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66476007)(4326008)(8676002)(6916009)(54906003)(508600001)(66946007)(38100700002)(83380400001)(316002)(86362001)(8936002)(6506007)(2616005)(36756003)(5660300002)(6486002)(53546011)(2906002)(31696002)(26005)(6512007)(186003)(31686004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytzcVBXalRHNlZhSmNSWDZ5anJmcnV6eGlKUXQ1TTRtaTdvQXZXSnhsbTVU?=
 =?utf-8?B?ZFE2NVAvSG5ZNjRYQldyTWFXa3RWbWc4cmZMOS90SUJoY3FsYUNWMHY0aUkx?=
 =?utf-8?B?eFMvNXRmOFlUVmtEbVJteHdzS1QxMHRDL3IxT3k0VGRlV09HTkkyOHZrOWxu?=
 =?utf-8?B?eG4wZ3dsTlpwUDcySmRzTWZXL2lLQ0lUZjEzRTMyUy8ySGRRdEpxWXlDSEQy?=
 =?utf-8?B?RFJzSDN2Nmd5VEo4L3BBQlprUzVhTXJFeWlxam9aM0xTYnZUT3RpSWpxS081?=
 =?utf-8?B?dmswcHcvcEJ5LzBiNmIwZUo3UHhnZXBFK2RncUxEbno2c3ZMZ05SRzU3V3Yw?=
 =?utf-8?B?NHVRazFyMXFvcVBLMDdicXdZaHlMK0FTdHRFSG5WZmMvZ09STlplMEN6SGxT?=
 =?utf-8?B?bGM1WkdVbGxhaS8zdUhkcVdMMHJmbzFmekFvTXR0ZGFUdE9iN2c5a29HazNT?=
 =?utf-8?B?MVRJTU0vS0tWZkdONlQvNWd1NzBrQklEaUgydTRIZWR0bmVaelEvSXhlVFZQ?=
 =?utf-8?B?dEVqWDN0Y3JpUlREdlNrWDZjeXpiSTYxMU5SZ0ZuUlZvcW5sZEZjQUpDcEh3?=
 =?utf-8?B?Qk5HNVAvenlrVFBRWUxtd0pmWjMvVUM5d2laTHBvazFmSUQ2Rk1ZY2J4dU8x?=
 =?utf-8?B?S1VScHJiOHdUYXMzMXJVMkdYb0RpcHVEZEVONWJtMVpyc0haRm5JQWZRUXpT?=
 =?utf-8?B?Z1gwVHJmSjF1djFuc1pjNWQyamtHaEpjSGVCVjJUTjZNUnJ2Z01ubkt0SzFX?=
 =?utf-8?B?bzdpS3g3YXJqK2ptai90c2RKSndVOFY2aGhxZ3JweW4xMTJPRGxCd0xjUUo0?=
 =?utf-8?B?YWp4alR2UG9vR1d0NHdqczFnc0RmRzdOaHVzdFhGcWhhM3k1L0xORzk4SDQ4?=
 =?utf-8?B?SmZ4YlBVWllhMjdrV2k0L2xCdUVHMk5KdXBJREwzL0VaQTBZQzlJZ1gxMys3?=
 =?utf-8?B?OStJbDYzTk9vSjBqbXR2bGs5UjFpKzcrWUpicWRYRnBTY1pteDRRVGJXdCtH?=
 =?utf-8?B?TzBFMGVyd1FkMXZsZTVDSWxESDNSOVZQQjlCaU5KREFvMXZUeHJOeXkrbkJY?=
 =?utf-8?B?OHY4aFl2ME9jRk9kajltQkdrc2I0UmIzTnQrMWdYUllIQnFUUlh6cE9SNldJ?=
 =?utf-8?B?eGFtQmlPS1ZPbm5rV3FXMlNMYkNybHQrQUpWTExwZE5CbzFpOWZMOVp5VTdM?=
 =?utf-8?B?U0pYYWZpRVU0RC9hLzlvc2I4Q1ZBV0FOZVpDWU9jVmdVdCt5bHc4ZEh2KzJ0?=
 =?utf-8?B?T2NjV3hLamhmV2hQOCtrS0xNVTQrVjB2K3ZYbUJwQ2g5bmpHcDQwVUNkV3ND?=
 =?utf-8?B?UC9JOW42VUZpdlhmRmFwQjFuanI2RHFZaGczYXdPWkFwbEpUS3BlYkJ5Wncr?=
 =?utf-8?B?cTlkcGQ4eGZGQkdQRFZwSVJPZzNpbm9aWXgyLzhrT1RHS0oxQWJlTk9zdG04?=
 =?utf-8?B?ZGM2dGViT3d1MzFvd01XVHViRGRRZ21zSE5uNWZESFp4cXJkenVHb0t4TXdJ?=
 =?utf-8?B?NUJIN3Z2RkNuejFmc3ZZd0lxSjdnY0JMZThxTTBtbjFkcTM1a0dLMGRURWM4?=
 =?utf-8?B?RndyN3JvLzVQRHl4eEdmdHlvUENuWUNsWDBYS3lJQjYxdkkxejh4RXZLV0lh?=
 =?utf-8?B?NldTZlc2dlVkVG50TDR1dWcrVll6VFB6RFhqMm5KRnU4bkc1SjZmT2c2dVZ2?=
 =?utf-8?B?UHlEWU02MFlXc3dEVHZKVjU5eS9Ud3NnMXkwdGVJZEIrTnluaFM2cjVqWjBP?=
 =?utf-8?B?K2ErMXdyNGlCc3AwMFMzQ3R6eXJYdzJvTWpTQVhBeXZmbnNpKzhoOFJHRjNV?=
 =?utf-8?B?NDBEaHhZQiszelp2Y25xRkllZVBRZ1FzNEV2N3E3SXoyNWZYampub3NhSkkw?=
 =?utf-8?B?bFZNOVM2MjhCSjNtMjNtYXBMNy9EUnlBUHlKZzBKaG43MlZ1T2NQTmJlWGg5?=
 =?utf-8?B?RzlzSjlBaUFXUTdKcWZTdjZhNjkvY1NFSFR1YTZ2VTBjaHY2MXNWdnZZMis5?=
 =?utf-8?Q?gE/4n/cFDZ+IWv9mcpMCGIV1vqXe4g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c16b56-3217-4efb-ca9e-08da04b78c77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4191.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 06:06:00.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YELeMy9EcqZETF311uPB8RGLM8CSQmp6tSgIwJf9e8evcznx0HtxTBCAq+dDqehNYlvcER6CX1n9bExo5oh4f9xJ6qJwV+Qvsjiv0hFRg6w+yrizRt8f293psBJ9BNO/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5263
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10284
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=750
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203130035
X-Proofpoint-GUID: txQifhLfNIk2d3JO60wnHmxYi65K1ZUO
X-Proofpoint-ORIG-GUID: txQifhLfNIk2d3JO60wnHmxYi65K1ZUO
X-Mailman-Approved-At: Sun, 13 Mar 2022 07:34:51 +0000
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe,

On 13/03/22 3:57 am, Joe Perches wrote:
> On Sat, 2022-03-12 at 07:26 -0800, Harshit Mogalapalli wrote:
>> kvcalloc is same as kvmalloc_array + __GFP_ZERO.
> []
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> []
>> @@ -308,9 +308,8 @@ v3d_lookup_bos(struct drm_device *dev,
>>   		return -EINVAL;
>>   	}
>>   
>> -	job->bo = kvmalloc_array(job->bo_count,
>> -				 sizeof(struct drm_gem_cma_object *),
>> -				 GFP_KERNEL | __GFP_ZERO);
>> +	job->bo = kvcalloc(job->bo_count, sizeof(struct drm_gem_cma_object *),
>> +			   GFP_KERNEL);
>>   	if (!job->bo) {
>>   		DRM_DEBUG("Failed to allocate validated BO pointers\n");
>>   		return -ENOMEM;
> 
> trivia:
> 
> The DRM_DEBUG could also be removed as the the alloc will do a
> a dump_stack on failure.
> 
> 
Thanks for sharing your comments.

DRM_DEBUG statements are present in other parts of code as well. So 
didnot remove it.

Example below:
drivers/gpu/drm/v3d/v3d_gem.c at 322.

  311         job->bo = kvmalloc_array(job->bo_count,
  312                                  sizeof(struct drm_gem_cma_object *),
  313                                  GFP_KERNEL | __GFP_ZERO);
  314         if (!job->bo) {
  315                 DRM_DEBUG("Failed to allocate validated BO 
pointers\n");
  316                 return -ENOMEM;
  317         }
  318
  319         handles = kvmalloc_array(job->bo_count, sizeof(u32), 
GFP_KERNEL);
  320         if (!handles) {
  321                 ret = -ENOMEM;
  322                 DRM_DEBUG("Failed to allocate incoming GEM 
handles\n");
  323                 goto fail;
  324         }


Regards,
Harshit
