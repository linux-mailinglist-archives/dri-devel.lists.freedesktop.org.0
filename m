Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94140BE4D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 05:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A766E8AF;
	Wed, 15 Sep 2021 03:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AA46E8AE;
 Wed, 15 Sep 2021 03:34:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F2UwbW011635; 
 Wed, 15 Sep 2021 03:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zX4T+DjDPIG2kam+LSvFkgCjmle0P3+OdAD5rany9Uo=;
 b=UMhmhbrePaxsCtWbaDkd7ck7QIiYsLd+/0kj0mYSR9v6UhVG9Z8sRQdVb1+Lpe0vrQex
 zVLynJVxzpviEMP0fELbZ5lTr/Do2MfP9Cla0RTMEOQzxm5hSBFcrjHdGAFWXTcyxeoC
 himuV2LTskwOWLYcZCfhYzmqEccs9AawLkCMAbg12cUTehUuy61SRlRtLQY9k8UfvGHT
 C53yufSX2zAqogXe3ijd6WDmhfzVlC7eH5cXoX8/SPglWRve4uyNl6fp+jhllZ0sDqzn
 ro2C5/f9R0YT5B40ZZYELcEdjY8hItuMtrfbhaRJzizxskz0vaTKH1KPl+C5b5lg2uzA Cw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=zX4T+DjDPIG2kam+LSvFkgCjmle0P3+OdAD5rany9Uo=;
 b=VI73KdElFE599m3i3Gu/F8Umi+hGrGFs0dssDR0rs+tjSdMSgZkV5wrQ2/26UVsRlu3a
 KDVsW1nwel3qyBCvF8thZcmlvXa/TnYnibg6d7/pdt/NBOceBMQUthWCYKQNEVnstyJ9
 w1JGGb/G+OIHvG6Fc3BDLXVc6V3U0IRYfd9IdqaTDopCvYo6fGVx/RQ4scCV1T6eDte4
 l1lbuXBCOqO9wrv3XmJVY1kxb6bRk2P0OqLPnz9UkcsYWnQN4QbltGpEjoHB1EYmVE4r
 nepSebwGFd3QAhB4ucyAOofi5zvWl959CHMmu8k7lDUUXM4cihcZfzzfFWeq76Xohoyp LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2pygb629-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 03:33:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F3Uad0012558;
 Wed, 15 Sep 2021 03:33:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3030.oracle.com with ESMTP id 3b0jge0apf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 03:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3K6utEyjWcT0c/kbgrcdmhJ92r8gx9U7eJNr8a9R/VqfoNy4QJk0XMjytl2O5leDUynZCrouWe0g+rUg8NRNgMowvkDpJ9lo1yYW6dzYtLvicy6U+x9fTUvwI6iqwWclcLII7vs/Eku2DQSAMqaRlZBJydnsyz3WoeECAMxrPKLjMo4rZPfNCNUT0RuPLw4Q1KNBLxQeCTTflBGMRgD4MHy7MX9J3BEja88R1BK+85KE0BzVAZEtAdJHR0V6WdZxiM47QPMAo+oQ6pQ4NJOdoulJHmr5gbJG0XDJX7s4fnfHJt3G0rGt+VMvPapcCI0xrhk7QmQArVrgnNuH4DvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zX4T+DjDPIG2kam+LSvFkgCjmle0P3+OdAD5rany9Uo=;
 b=CGAIOgIcWSGvLZdf2U8l7CZVp88Y92E430p5PtxvTJOfJSq8IY5apkFlGV1XS+P5sZ2s8kUaVNIdqMPntqGxJNe+x+XuRXrxj8KRks7aq8+CUK9MoLGYeK/WSdA1ueDL5i6QoUEashs45V+7LgQlBBLVVG1rVJxE4PodR/a12ZSBwWQSiJjBHjG+u94axdApebLv+6/pL0f5YA9AWS0OOFR9WoLSkZk+8duBAu0Dxx9eT/5KwFs5c9shZm06crOUvwkWXLmjPQ2jjoFts+Cq44kncWW/xmU1pARfch83AmvOOtqdrCnesGOO8xr/rpWoc6pMhy+4RmPPAQjj6nW4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX4T+DjDPIG2kam+LSvFkgCjmle0P3+OdAD5rany9Uo=;
 b=gPIW4ZOihw6sfWhiQGNnTmmA+jaR+1Le9ODsK/TMUBzPSDXk+LYxrDz2uqEmt2ReSdkiU5qyIKMGvjrH1C0Dedj7vNY+Rn4ICWG98Z0jEECRSMlMJVU4Cz5auLoi9XG/JyS7p+hFSYjGiW3cg/yA5ZLUwcarU5h5lO+9a+vz/iE=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1727.namprd10.prod.outlook.com (2603:10b6:301:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 03:33:29 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 03:33:29 +0000
Subject: Re: [PATCH 0/1] lib, stackdepot: Add helper to print stack entries
 into buffer.
To: Vlastimil Babka <vbabka@suse.cz>, geert@linux-m68k.org,
 akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
References: <20210910141001.1622130-1-imran.f.khan@oracle.com>
 <efc1564c-d39c-c6d2-80de-5f79772732e4@suse.cz>
From: imran.f.khan@oracle.com
Message-ID: <3ee6fc6a-3bcd-bc51-2720-0d683fd19d51@oracle.com>
Date: Wed, 15 Sep 2021 13:33:19 +1000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <efc1564c-d39c-c6d2-80de-5f79772732e4@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0043.ausprd01.prod.outlook.com
 (2603:10c6:10:e9::12) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from [192.168.0.2] (110.33.47.182) by
 SY6PR01CA0043.ausprd01.prod.outlook.com (2603:10c6:10:e9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 03:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986765c1-332e-4154-0f4d-08d977f995a0
X-MS-TrafficTypeDiagnostic: MWHPR10MB1727:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1727FA97C6EC231C80D41ECFB0DB9@MWHPR10MB1727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Sy6j3oCa0OrFOT1BaJGIJSB3KbpE87DDuwFKgtu4mfC9jT0FrYim1TFzhMjy+AMTYfRY+oA8kwWnbLcOVXQGt9Qyx0JcouDadzVS17Qpnf/9ApiB2DYrR4RUkw1N3xur9ENFwZtiudjENZlb2SwaZLhM1ODaX/ChZqNpZWkr0MLDTW1G4JvDuC7yOH1kFMKxHJ1cY2pqYjOS9kJyoC6SGDr4fNgJby2Tif8Hp5IV1w4ARHWU+nxFWb1frBnFOIAQKQLIV45JoBEK9H+mSuAEte2tY0ik4ofLuAkqc8kc+eSzoRSTcxr1s+IeQnpSkMXlIjiSAL/Xggo2N8NA2byBzpdhBEDFNGqY44pcODrKoDzK7M571wKzu9fLQKqkjDMtri6iYqkxZ9NCC0uYz/GzHdLK05fWGE+dzPdDNnBazR/9MZSxWLnN0pAVBGDbv6Cw4SHpiSl4D2nG+Q3QfhZvfI7vEoP/4tvGTe2FK2Bt581C0fva8HNc26v8K4ybr0Gddz8jljVbwE7MQoRAhCaILyGsMhs/9HFO+dbQgqs/DjapAdPSQeACBB79yAv2K7jrm2zSoNpQdMLD+4SNSk0ChEcemaJLcn+GoBbcOcgCpCEj5zzq/2nwQRp37TrazR29Lde3/P93Xen88d8t+32pVAvEZHryO3CHtnjkWlHbOxe3ZYDNJeH/DYAcb1IiPG11qGp1PCGPYA2llkOiyu3ElkMv5cxBfpUsXcPLNt8q1aN7Z+Zt8Q7nxFcEfFnCbfb3v6h4U3oRVYHRKD7w52mCStYO1is4g1LD8HvOyXJFWhblTZh1jyola0IMUet/LyqrpThLDZrIcsHLYJhsishrWFYuIBfcpWsuFcMe56jLAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(136003)(346002)(396003)(186003)(26005)(66556008)(53546011)(8936002)(66946007)(66476007)(8676002)(31686004)(2906002)(86362001)(38100700002)(921005)(31696002)(478600001)(7416002)(966005)(5660300002)(4326008)(36756003)(16576012)(316002)(2616005)(6486002)(9686003)(956004)(83380400001)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lPcFgySnJoUlRpZDhNNFhvS1VrMTV1SHNWUkkvb2RFQnhnR3U4dGFZNzNm?=
 =?utf-8?B?ckNxOWFQa29aQjZhSUlHNkZCSGJOVlo1TkY1OEx6b1dlTngwcUo4RlY1OFA1?=
 =?utf-8?B?N2F5UVNycmk0QUNtcHRrNXgwbGo5V21VNE9iMUR5OW5sdmhwTU1pQ1JFWFNZ?=
 =?utf-8?B?dE50enJpT2hyVVRvTHBHNnVNb0gwUDE4SmF6aDJHV3FSMzBvQjFOc0JHYkgx?=
 =?utf-8?B?OW1Vdi82Z01tSitabXM5N3F2bGhuOEtJZTlrQ1VvTHZXQXRNL0krSXR6LzNW?=
 =?utf-8?B?NDFwVEVXQjJQRFJwYjFxb04vNlN6TmtmaW5qc2ZzQmp3Rk5ZbytzdVdia2Rs?=
 =?utf-8?B?T1EraHdieVoyUE5Wa0pBQUJ1VDhWbjZnWHJxZXFlK2hJZjRJZUUzR21wY2Q0?=
 =?utf-8?B?UmZiMi9XYTJQaDcrYnd2SDY1QkN1Y3hITXhZRzc3TURsVmN1NlJXemhRbzJh?=
 =?utf-8?B?bXhTYi94Y2pRa2p5K1VPeThKdEV0QVd2Q0t2djlqOHo0VnlZc3dIaGNUQVJB?=
 =?utf-8?B?M0ZSQlBXa0VSQllOeUZUWXpjK0lOMEpTSjNuVHExK2hBQWNtN2dPSklmZ1dM?=
 =?utf-8?B?TE13d2Q3djU0WnFPZStFLzFkWEswK2FWUW10MElZeHAybXpuSm4wYWR0bHN6?=
 =?utf-8?B?UTFwQ2hRVHlBV05MSGNTeDVnNHo2cWdkVThhbTBka2JJVm9QbTdKZ0tNRnYx?=
 =?utf-8?B?Vk9pRmk4YjUrK0U2WFBlcUdyQXhHK2Y0azBQcmhUdXdiaUg4SzhVWWJUdFF3?=
 =?utf-8?B?ME5ya1hBSTZQMDcxWGFiRkFwb2R1blg3bElrbkZyNXhQSVhnOG1XVW83WnNO?=
 =?utf-8?B?cW5EemNDTUlxdWxRdGorWGNhd2FhZE1tWjRUb1pXYjY3dG9UTjdhMnZZMzg5?=
 =?utf-8?B?KzJWc0FkQVR3WDkyc3NxYTR6WWIxb01MaUdKTDFUNTBKbHhxTkRJSXNFTStx?=
 =?utf-8?B?OEdkOUZJR1B1OFlhZkJNdjYvYkRZNVJQWHhjcnRpWHYyT3o1bEFlejEvbTBQ?=
 =?utf-8?B?dVpUTlk0OEVOUDVvRnVSN1ZPZDBTc3oyWG9qV1RCUzNoTTN6blhGV0E0Vndr?=
 =?utf-8?B?SGFab01pemNaRkN0Wjh5Rk01SEJhOXlBdzVPd1JqYks1SW5nOWFRTk5lS2dF?=
 =?utf-8?B?Y25xV1FtVVdtSEVHTDByTnIyN0I5TTJQYmV5MXdOOWZKV0NVSFNMVkV6NnVi?=
 =?utf-8?B?N0R3Zno4L2UrTzgvYmFsMHNkc0p6TmFscGhMYVZzMzhIcXJTRnFtdkpOZndt?=
 =?utf-8?B?Vnp4WHo3YUVIakV0enB4S2R2VHUzak1xWk5WNXhUTzF3MnNBSi9CMkNtMUFm?=
 =?utf-8?B?VXlKY3NyZzB6NXJqaFhSTzlWbk1NaW5FdS9rV0hCbGljaHZsT2xVWXZYdGR5?=
 =?utf-8?B?RjZkbFZlOGsxMEdYTnF2UHRDM2ZZdTBwMWtNY1F3R1FWVHk4MnNnV3RtY2p0?=
 =?utf-8?B?b1ZQeisrUHNSVmJBaFJCeXIyWlc2aGhvYSsvYTlEMEdaTnZCSVpKSGExTTRl?=
 =?utf-8?B?bFc1dmZUTktSRUsvNGk3VC9LTUkxZEJxZy92T3gvUjNpRFZ3bzZ4K0hvOHpY?=
 =?utf-8?B?MXNlaGhYczhmdWZVWHlOWElZR2pWUzlRelpuSk1UNEErbUtvWWcwVG9XaHJT?=
 =?utf-8?B?NXpZTStRR2RBSGdrTHlJclgzR3BqWXVpVDNFejMzZVBsRjlodTcrOTJDMWpB?=
 =?utf-8?B?VTFnZURlM09hdVlETytWd0RBMUVzUUV4bmtQcUUxV2NWTUt0TGlVYmNMYlBp?=
 =?utf-8?Q?rWfcFFBGEkgI7tb9lwDLQwer2kweMNJXv0JDUZu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986765c1-332e-4154-0f4d-08d977f995a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 03:33:29.2454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoJF0Om+SlFd5OYrpAp7tJV2fpG0Eimm47Yi/e5XbQSaaUO9RHN85vvhFzZm9mV5kb2MYT5puN2mb2x8VYdxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150020
X-Proofpoint-GUID: -HXzBvccZ7Jogx8pVFGOL45hBngvfa7c
X-Proofpoint-ORIG-GUID: -HXzBvccZ7Jogx8pVFGOL45hBngvfa7c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vlastimil,

On 14/9/21 7:03 pm, Vlastimil Babka wrote:
> On 9/10/21 16:10, Imran Khan wrote:
>> This change is in response to discussion at [1].
>> The patch has been created on top of my earlier changes [2] and [3].
>> If needed I can resend all of these patches together, though my
>> earlier patches have been Acked.
> 
> I think you sent those at the beginning of merge window, so it would be best
> to gather everything in a self-contained series now and resend. I suggested
> another change for one of those anyway.
> 
> You can of course resend including the Acks you already got, as you did
> already with "[PATCH v2 1/1] lib, stackdepot: Add helper to print stack
> entries into buffer."
> 

Thanks for clarifying this. I have resend consolidated patch as per your 
suggestion. This self-contained change set can be seen at [1].

[1] 
https://lore.kernel.org/lkml/20210915014806.3206938-1-imran.f.khan@oracle.com/

>> [1] https://urldefense.com/v3/__https://lore.kernel.org/lkml/e6f6fb85-1d83-425b-9e36-b5784cc9e69a@suse.cz/__;!!ACWV5N9M2RV99hQ!aF3HSKJ9eit2OvdDk5j_DTKT8rL2SkG6cYL1lLVvegHz5_YTJhN7dSkHgBKeJjupkw$
>> [2] https://urldefense.com/v3/__https://lore.kernel.org/lkml/fe94ffd8-d235-87d8-9c3d-80f7f73e0c4e@suse.cz/__;!!ACWV5N9M2RV99hQ!aF3HSKJ9eit2OvdDk5j_DTKT8rL2SkG6cYL1lLVvegHz5_YTJhN7dSkHgBITooNU1w$
>> [3] https://urldefense.com/v3/__https://lore.kernel.org/lkml/85f4f073-0b5a-9052-0ba9-74d450608656@suse.cz/__;!!ACWV5N9M2RV99hQ!aF3HSKJ9eit2OvdDk5j_DTKT8rL2SkG6cYL1lLVvegHz5_YTJhN7dSkHgBJcGhmlHA$
>>
>> Imran Khan (1):
>>    lib, stackdepot: Add helper to print stack entries into buffer.
>>
>>   drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
>>   drivers/gpu/drm/drm_mm.c                |  5 +----
>>   drivers/gpu/drm/i915/i915_vma.c         |  5 +----
>>   drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
>>   include/linux/stackdepot.h              |  3 +++
>>   lib/stackdepot.c                        | 23 +++++++++++++++++++++++
>>   mm/page_owner.c                         |  5 +----
>>   7 files changed, 35 insertions(+), 31 deletions(-)
>>
> 
