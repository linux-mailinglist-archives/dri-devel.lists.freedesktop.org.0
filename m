Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B04EACD0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 14:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364610F087;
	Tue, 29 Mar 2022 12:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43E210F087
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 12:02:32 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22T8oU78028587; 
 Tue, 29 Mar 2022 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4tzEHONs8Ktkexl1JN856D4c2Ta4AE7eRchtNiNQIpc=;
 b=UVQXq7AlMkilK2y8IlD4Hxm/4QqNlq/onledqby50WTFXyk8ESRc/+80kQ05ti1jcqn9
 ngXXE9x0eYmgniQHCec26A0WUd2YYagXG4b3JMD7bf5Ur87RI9pmUcj+hZTfp/HO3x6k
 0gUfVaSf11lcBmiYfvJqsMn1mMN/JCXZXVpFrUvoy8yEiLOkBrIvPrtCrHXQjHmDwC6/
 TmbX250qi9MbsmqbpZl0Pw0C51vpZYyf7jE2ODT49ma+9xu1Y4aa+EgN25SoIfPggwho
 uCUiTOH+rf0lPnU5w/gIjlWvCv/RrrsWDiAphPQr6TApjTon8YV/Yey+GHenx+UaXOc+ GQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb69m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 12:02:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TC263r009207;
 Tue, 29 Mar 2022 12:02:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3f1qxqea20-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 12:02:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izhrNl4PSYubacAesmRPVwWdSZ9ER2pob9hRdTwn7/DGqYghFetGINEP2BVhPPwdw7K+D6nQgb7SofwfVC2IuO/4QbMbBu23t5vZjd2wbatuVRacdnJX/B6W6tjDkb/XAxQ9bXEMAlAc9qL5wB0jO5d+E+kAlgy9+7TGFmu2vC8kjR7LuGCL0y2y71mzNwNBAqq4W06F3wIVf608FD+cqmzQFwJFq3dyTo16waV7tLdt+WzxSGqW8C4YNwgqEsTDr8OGuBzqQqEucL/TwZiv39RYuTcRTf3CNROAV05xeWwo9/vMJkP2o9Vuo+pLDJfDp+nENVC/wskg86nwtj9ZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tzEHONs8Ktkexl1JN856D4c2Ta4AE7eRchtNiNQIpc=;
 b=Ijf96+bFId0B9NwDZxXKzKglG9Lrs4rqCAAfPNO7xvTpxH/UxTiUI0kVhRW0N1KpYp3IG3iLBtGzs0u53uYIgRgLL1p+shYgD5w0NNzc823DOoubZo/zPtA4mq0/+rKk02LtZrvQkNzC3uuA2fdIpQDflMeX9dvljfjM02tK8EbliJT+66PKk/6JNLHSf9YbMyoMjza5LnMYez7A1bpLSaPo3T3gCpSCmzmc7SnDMAuANdJ4djaZf3v1Qu23ZIorIkRw93X9cmIIHH4QeorcI9VCSJoU9/7wvdPhqtLWl2Toi/XjXUyUBa+Ecu7LWgoGJ3VchMItuYMq8Bq0Q3Sz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tzEHONs8Ktkexl1JN856D4c2Ta4AE7eRchtNiNQIpc=;
 b=EZGQr+5ihRuLvqZyU2g99GYDeANutK7ZQf0cFbEjjR6+A7zfrivCUIY+r+FYSQW9la7UJ8tAydY1o8kTkF3+t+oYytad61EOOVTMuPce8wBBJl95PhbXJnFcl0Hsb7asGA+yBIHmAFqMfdDqQrBSCFXwWcpQ8G1qmRUJd/MA5Rc=
Received: from MN2PR10MB4191.namprd10.prod.outlook.com (2603:10b6:208:1d1::14)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 12:02:05 +0000
Received: from MN2PR10MB4191.namprd10.prod.outlook.com
 ([fe80::bd63:ee61:5870:7b23]) by MN2PR10MB4191.namprd10.prod.outlook.com
 ([fe80::bd63:ee61:5870:7b23%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 12:02:05 +0000
Message-ID: <3752c4c3-120f-e520-1cb0-cca7e8adac2d@oracle.com>
Date: Tue, 29 Mar 2022 17:31:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/v3d: Use kvcalloc
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220312152656.51625-1-harshit.m.mogalapalli@oracle.com>
 <20220328122536.cobmqclwtl2ca6k4@mail.igalia.com>
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20220328122536.cobmqclwtl2ca6k4@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::13) To MN2PR10MB4191.namprd10.prod.outlook.com
 (2603:10b6:208:1d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6883885f-2ad0-4d6c-7b7e-08da117bf11f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB329073169F82B36E5415A540C21E9@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lh4/XhMbGGd1TAm9SGveKqRgZS/8oIaTBZRsnzBIsptOHYue50i+E5kio3LbNXKsBi2Ypi8DrbA8Rkzj8dPZsBm/d0T4OAyIXDyZq5sRabVEeLgUg7Q3P7KuHvDCG5s/crrQlg5JjSaIhJuNcGQmOfPtUvTfno1lGyucSSKNH2SpvD+48RhrdusH/PrbvMUnJRvN1opryNcDjxU0Hk59FJKBEdF3k6VcWbGJkxK5ptzmQUX+06O6GBhncbh1BCbdLKjwZxPyuUNY5ClW9WTIKACEg5+iuUoj9gU4DXMDYyLzT4oJemHgMkQe++T0aL8IFi3M1geeZ/VGMmcAImPV7j7nmUNK8buppapzXz6tzYDqfc1zlCDYAEkTn7CuENH+LTkwfVlELeLNLOVSkEXN++CePz5/WiHWQfhaGxpYJtFspzvxA4aQt9RFtkcBbkFJHK/wh43Nfi5alVCJJUKRBUfBq5/Fzp6fmfswls66zS/ABkwft0DNLt6W1fpse223fkXWrV1Ra2YN6e4iOuQ/ZPMtUHPtiM1k6B6fAGgQ3QxOUzE7s1OBUTo8nqxAoIkFNMRwrbq+UDEuZS0Gt+Em1kVLogY7MRfVdPzESbqQyXI8gA9BGfkxli2AKqMf0ezr0AGwHur2lX8quN3LluwafHU3SoR0lcxA6qgh47l6aUUms9tSqOQUi/oB0uOuK/shCEeZcQZ2M0/Plkgz6twszxxPmytwvHgG5hEc1dZ4L/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4191.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(6666004)(508600001)(2616005)(2906002)(6512007)(6506007)(53546011)(6486002)(8936002)(5660300002)(6916009)(31686004)(38100700002)(66556008)(83380400001)(54906003)(316002)(86362001)(31696002)(66946007)(26005)(66476007)(8676002)(4326008)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBNSUNXZWovUlNEL0VFZXQzVGozanROWlhnSjI3V3pOSkRIb3dvTnJKc1lh?=
 =?utf-8?B?bVhmMG5UKzZieFhpemJOaS9wNS8vanJmQ0FGVEpYaGl4RTMvK3FDRWhpQU1Q?=
 =?utf-8?B?YUptVGpDTkVpMHhDRUdBeU1RSFI0N0ovelRxVk1pa1RlcVhxdG1ITE80Mjd4?=
 =?utf-8?B?ODk1SU9DVEJsOVgxN2FIOEhEaEVUQTZrRDRFaEpXbjhzcS9hNXFEMlFvR2Jm?=
 =?utf-8?B?RXFrMVE4SmY3OERxb3dRalFwdmRUVjFoUExsaGMzSVhRRXJxTU5tandMZDZp?=
 =?utf-8?B?Mm9jbWsrMEJidTF4SWxPczV4enJSOXcvZEd6eTJUMHViaFQxMktzMmdUN2kv?=
 =?utf-8?B?djg1eVBOdmMyNXpVam5lSW9IcjZDVlczNUJlblZOT25QeWNVL2NoRTJZSVFY?=
 =?utf-8?B?RXlpc0ZvWXNZdVp4ZUJ1dUU3WXRkVDR4Nm8ybVJQcktnR1p6ZVZvREM1YXNj?=
 =?utf-8?B?WkkvRlRIYUFDQXd0RWZvYjVMN1ZGcFNoOWE0V1VEVVV0SlM2bGVTNGZEZVNM?=
 =?utf-8?B?UnNheFN6QXhabEZ5NzA0SWRsVXBHdEFqL0VsdU5KZkJGYm8zQXY4SG56VElv?=
 =?utf-8?B?b1lzYktmeDJDaWVZQzZiem5mcWNhUnNMNWp0TVJuaUdaL2pHbHUrOEtkKzlw?=
 =?utf-8?B?dzZSSHVnUEo0NE9XMS9qeFEwdkJjVzRZeW9QeVF6bGcyQ1ZKQlJ2RmdHWEdZ?=
 =?utf-8?B?TlVJSTJKaEFOV0lrMlJpUzM4bUZTUlFWZFVwb3QxTmdaUlJFMzZQcEZ5YjVL?=
 =?utf-8?B?RFIzelp6UlpZZ015SVMxMmthUmRMK29scUtzT0pQOE1YL2hXMXZNTkRUVUI4?=
 =?utf-8?B?MllqYXVwRjJxdjRXQUtLZXVEZFQ4V2tUb2FhWXRxNS85S0JkUkpYcGdvMGtO?=
 =?utf-8?B?bE00aC9HL2VkazBvWGZTOHZBL0JleFl1VFpSWlJaVWYxcEdjR0piZ2tVTk8y?=
 =?utf-8?B?ajJWenoyTmJhTVEwTExkSC9SRjZTY3RLaDBlWUMzczBjQjEvdit6cWJzOFNG?=
 =?utf-8?B?Z29QS3ZVQ25nV0w5Uk1BOHNqYVdBU0xvRUFLYjM0ZXZLOGVTUFovRVp4OHhi?=
 =?utf-8?B?T2lldkpuclc0SlZCaXRhUDkra2p0SjFWZmNueXFJa3ExNmV4TW1Yd2VEdERF?=
 =?utf-8?B?aHdaaEc4S3NRU294NHR1dUdTUDZsVVVxTHd4NmVuYjRPVEord1Jad1c5RDZx?=
 =?utf-8?B?amphWllHb0ZWN0M4M1JPNUtKRFNUelV2cU54cUlwVEl4SmlTaytwQS9qeVJY?=
 =?utf-8?B?ZEw2RTBmbk5sOHhDdXJDd2t4dDdtRkFDNzRhSllxRDZndjhtS1dxMHFVVmZs?=
 =?utf-8?B?WkMyUnhlM1J6M251MUY1TWtEdjkvRTlQelJXa2tWMXZiZWJ5YU8vbkV0bEVN?=
 =?utf-8?B?UGI5TitYQVVGNnlsZlczbDRPUjRXRmk3MDFBM3pZajV5NnV2a0hTMFRpMlRj?=
 =?utf-8?B?KzgrZ0J4OVdRL0d1dzVmajNZemJTUlJMcjFiZkh5VjZ3em1lcWhDWHcrcG9i?=
 =?utf-8?B?bGV3QWpHNjNnek5QMHkwRnA5Sm5UUmFnYnU0dXhsRUxxR3Z1TDZBN0FFSm9t?=
 =?utf-8?B?U3FGSUtLQURPdUsyQUtGK05CNzh5K2RLYzJaVnVuaTdCazRkbWh4ZDEyWHBM?=
 =?utf-8?B?TEI4Qmh4WUN3R1R4emJ5cDA0UzRjU1hOTEdCUE5rVjQyVVhJT0FHbjdCRGlX?=
 =?utf-8?B?SGFpaXFZcy82azIzSHZMZGNrSlRzcVk3VlVYYWFQUkluVFN6WFRtd2JPNXhC?=
 =?utf-8?B?UThnYklxN1RKZG9aMitTQnNlUjZwR0wvMkIwWHlwbG8yLzl5aXVwVDJEcEpC?=
 =?utf-8?B?N2RLNytvNCsrOHJnV3d4UTFyRkhzWFdGbFRBRUlXOUNaMlUwelVNVGdHUXlF?=
 =?utf-8?B?cU9YRzF6SThHYU5temhubmE5d3NrMUtHYjUzQXZIMlNrUGkwTjQxUUJJZk5z?=
 =?utf-8?B?cCsxdDE1TmhHM3g5NWYyTVNHaEhDUDE0Ti9xNG9OSnBMb2ROeEtqUHZtdUVl?=
 =?utf-8?B?eDJVOUZNQnZEWkg0QU1zd1hJazZiYW4xWW9lMk5Rb2hkTS8wVFBZQlBSQTFn?=
 =?utf-8?B?bmJ6bjkvZUhIK3I1ekFMQkFZRWpiZGIrNVJ4a1pUTmJaQ2tkTUs5b282UHE2?=
 =?utf-8?B?VmcycThuaEtWZnF4bWYrOG4rQlVNUTRCdnprMTNQUFg1cEowRk1ic1ErWXA0?=
 =?utf-8?B?N1F5Q1E2T0E1NXlRWXRRRmVNRXlSWlVZUTg1R3NSMWhkREJRY2NMbFlYWW5y?=
 =?utf-8?B?anZjd2lxUnFQVHF5bG1KL2x2YkpRMldmOXNFMVBPM1hUSktuZ1B4STR4Zko2?=
 =?utf-8?B?QTMrQkhCMU1UdHh6aWlXNW1JL21iWDB5RUJLb3MycGU0bW56dUFjb1ViZC9a?=
 =?utf-8?Q?OmC44tzueidOK78+hbhAEtyyZ3+mpeu8eYLT4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6883885f-2ad0-4d6c-7b7e-08da117bf11f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4191.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 12:02:05.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qByGj+uy1O8Os9aAVBlnICzbMI7Ali6FGtmc4omyEaqZjxn2KIGnYApZeCFKYnNkl3lTGWnHcI67OSGK30+UPv7xdnSR2GdX8olAv7cPB1c4EI4W1oifqPQxlLVXKgJj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10300
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290073
X-Proofpoint-GUID: vOOYQCulSxC3zrP5vjIu14imTEWihdZG
X-Proofpoint-ORIG-GUID: vOOYQCulSxC3zrP5vjIu14imTEWihdZG
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
 Melissa Wen <mwen@igalia.com>, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/03/22 5:55 pm, Melissa Wen wrote:
> On 03/12, Harshit Mogalapalli wrote:
>> kvcalloc is same as kvmalloc_array + __GFP_ZERO.
>>
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_gem.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>> index c7ed2e1cbab6..f7d37228461e 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -308,9 +308,8 @@ v3d_lookup_bos(struct drm_device *dev,
>>   		return -EINVAL;
>>   	}
>>   
>> -	job->bo = kvmalloc_array(job->bo_count,
>> -				 sizeof(struct drm_gem_cma_object *),
>> -				 GFP_KERNEL | __GFP_ZERO);
>> +	job->bo = kvcalloc(job->bo_count, sizeof(struct drm_gem_cma_object *),
>> +			   GFP_KERNEL);
> 
> Hi Harshit,
> Hi Melissa,

> This change seems valid to me, but I believe, in this point, v3d should
> move to use the DRM function `drm_gem_objects_lookup()`, and then your
> change goes there, since drm_get_objects_lookup() has the same issue
> you're pointing. What do you think?
> 
Thanks for looking at the patch.

Yes, you are right, the issue is same there as well.

Few other similar instances in drm/ subsystem.

drivers/gpu/drm/drm_gem.c:700 drm_gem_objects_lookup() warn: Please 
consider using kvcalloc instead
drivers/gpu/drm/ttm/ttm_tt.c:99 ttm_tt_alloc_page_directory() warn: 
Please consider using kvcalloc instead
drivers/gpu/drm/ttm/ttm_tt.c:108 ttm_dma_tt_alloc_page_directory() warn: 
Please consider using kvcalloc instead
drivers/gpu/drm/ttm/ttm_tt.c:121 ttm_sg_tt_alloc_page_directory() warn: 
Please consider using kvcalloc instead
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:541 amdgpu_cs_parser_bos() warn: 
Please consider using kvcalloc instead
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:152 
svm_range_dma_map_dev() warn: Please consider using kvcalloc instead
drivers/gpu/drm/v3d/v3d_gem.c:311 v3d_lookup_bos() warn: Please consider 
using kvcalloc instead
drivers/gpu/drm/vc4/vc4_gem.c:746 vc4_cl_lookup_bos() warn: Please 
consider using kvcalloc instead
drivers/gpu/drm/lima/lima_gem.c:42 lima_heap_alloc() warn: Please 
consider using kvcalloc instead
drivers/gpu/drm/panfrost/panfrost_drv.c:147 panfrost_lookup_bos() warn: 
Please consider using kvcalloc instead
drivers/gpu/drm/panfrost/panfrost_mmu.c:452 
panfrost_mmu_map_fault_addr() warn: Please consider using kvcalloc instead
drivers/gpu/drm/panfrost/panfrost_mmu.c:460 
panfrost_mmu_map_fault_addr() warn: Please consider using kvcalloc instead

Tool Used: Smatch.

> I already sent a patchset to replace steps in v3d_lookup_bos() by
> drm_gem_objects_lookup(), as I mentioned. The patchset is here:
> https://patchwork.freedesktop.org/series/101610/
> Willing to review it? ^
> 

Sorry Melissa, I am still a beginner, Can't review it.

Regards,
Harshit

> Thanks,
> 
> Melissa
> 
>>   	if (!job->bo) {
>>   		DRM_DEBUG("Failed to allocate validated BO pointers\n");
>>   		return -ENOMEM;
>> -- 
>> 2.31.1
>>

