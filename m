Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0748466503
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 15:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024A36F4D6;
	Thu,  2 Dec 2021 14:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568616F4D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 14:17:53 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2Dx3PQ010080; 
 Thu, 2 Dec 2021 14:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Yl90nILz0Ot2+e3hyUSpiJgMkKK597IdVLkJ8QXSZRo=;
 b=0LeCEAfuB8qKcwZMTpypeoUTSccDxOK1J4D2sr+AMKAX/qWCF9+5ViFWeU69G3jFpUmq
 NKsiA+Mgkb/Co+7Aj7T7THNw2RuIq/QBGoJwDVwtfCks9OCk/wzRwghegdHQ4GMkdhFO
 4l2GSaq9rSW+moo4P3BRwKsQMBaITnC7JiMW7snHPseLIQh0ohpGqI0jiKBGbNu24pii
 BdhtKd6FjqusarxGRkSgp/crJVUQBXVehbFgsXErzbvxYvfPYsqxLLxOZO8wqp0/k5gp
 9P5qClDtPcTHe65jLR9tHHcvOfkIm2xAUb85unTILEMxDWSDdJoxH85Gud/DkPGwAaQr uw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9r57sck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 14:17:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2EFqmT016624;
 Thu, 2 Dec 2021 14:17:48 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3020.oracle.com with ESMTP id 3cnhvgqk9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 14:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTFyxl1IYRFTCORcFTHcFTerj4px4hr2e9tpOzAfunpZeYITSndbIHYRGcRr37vI0jFMQqX77uoarDcLdSKAXDtzmQLDfp0P8RiEMUibnpfuRoD1PVvpWVP8ABk45ZERDdSyHSsmhfvZIGlLLF1XCg6PK4g7v1/DMHEC5RATeKA8AXY9OMTBlyaK1H7eyIU6hgoimyt8oVc60hSAMqmNEFJxVvjq5sp0Ja8sZCCsjwDlE+eXreMVjJxdw7y/duNEt3o+Dv9G63VvWdddMRnWJKY2tq+9r7sTGWd3tza2pItY6NCxMUKn/V7f8WKjlwW2q7zEsbxyElTMQ3yqU8RTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl90nILz0Ot2+e3hyUSpiJgMkKK597IdVLkJ8QXSZRo=;
 b=E4PRwTFxATMzt/dbGqfI6xK3BTOu/41Ti4ze6l61NselwNhPh3TcMX1uJGJgDtLb7maBbqlWPDNWxR5tD0snNHVzapm1PintRT0nqzkWxJ2suVwknAODpsRC5Y6MnAwtwuojQLWsBigJLr6yt9uGEmOQI0Oe5Wt7tx49k0SrJLJEGt2R5mAc5RSbio+YkKn+/qAYZ4Oe6Sqs+ews4pAMUWeGTSprh19NIMM06oOrYthF6zp2C01ZbUqewscA4V1PKfyukMvjUMB50fvI9v8pUe3TB9uV/t5FITbzkBzkHdjCqlqu6O0PLGHn+S4RjoUevxdZPalyQn0pB6Y3c6/9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl90nILz0Ot2+e3hyUSpiJgMkKK597IdVLkJ8QXSZRo=;
 b=R0KmE6tj94qcelUPTsrUsP8A3TLz4yWivxsgk2u/3DYPPMLcQ/iCys0IXEFCi93qbkXw4QZTMWRHxmRersdUmVxq0fFckptkK3t1sutCCENFt9Wo1RTO601Rk+UvFg2fgcS5BpMCcL0/REWRe5Fwwkzrig8DfMQ7l4VZylCY9rQ=
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN8PR10MB3202.namprd10.prod.outlook.com (2603:10b6:408:d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 14:17:41 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4734.028; Thu, 2 Dec 2021
 14:17:41 +0000
Message-ID: <79d30c1e-2d02-6e0a-6f33-172ab7f91722@oracle.com>
Date: Thu, 2 Dec 2021 09:17:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Content-Language: en-CA
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com> <YZdxFvGkBPXrtoQ7@phenom.ffwll.local>
 <YZd2VI820CUGrMjv@intel.com> <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
 <87a6i0jk8r.fsf@intel.com> <706003ee-62ca-17a1-f629-6bc010aa5d49@oracle.com>
 <YZ+rSG7VmZ2XbJrf@phenom.ffwll.local>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YZ+rSG7VmZ2XbJrf@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.216.51] (138.3.201.51) by
 SN7PR04CA0101.namprd04.prod.outlook.com (2603:10b6:806:122::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 14:17:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251f9d7b-929d-40b6-f9b9-08d9b59e8071
X-MS-TrafficTypeDiagnostic: BN8PR10MB3202:
X-Microsoft-Antispam-PRVS: <BN8PR10MB320207FB5BB29B814DD719ACE6699@BN8PR10MB3202.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sl/d9mkoMToZ/beVII2jJ/JWyNvZyhWduL/JP7sOl/PbpAd12I47JtU4gxa200LytwLBUOzxYC7Ovi8z0gpgArxUZZ7QKpW0gjmjxtfrlQFmYE/pY38WWBL2/S6cHuIxgZ9Yq0QTZnrYucGen8qkJn94RD9CkKcMaXwLbCzgo/xbm6hdyL/xPbBGqoWyFQs4wJtlGRDhT0zbSfF+uGc0AXl8qmDQ1yORoajgr8l7h+EmZwSH6g7QYwO4yXaWpW3DfsvNzKeJHFApfmK2m6e2JZ/xNaMBHZsKzhSfYb+ty66PyExkHu5iYga3o+r7+CceyMdizz9Xy/eZjHdXgI8fZpog9ikUQHPh3AUtvT2p8eCmEdFgKCXfIvKTSmCKjQ6r0RsFLWvDH7LNhFIsonf7+ucNHrO1l93iBsbx4UDTlEecEItkJEMf0hwte/Sfm/tk/eUWJgFFvDAYpEOmit25GFkrXZz5yxOYz4vjN60nYevhAepd9fYbyxLq7RTEV63/Hn7XTDad/ANetgzmu+mJYxid84f9TxGJMQ5RF/fAqCs5w+3PdkzT/eWfisyJkW+Y0mD/2uWXT+1U0YHFJUSIlTwGGDMHrATQqQmL9JKRH0ABpsZib2uT1fgfbhr7/VIFwluAwNRteHa6l5a40Uu93hN2C0s9BwY8OYkgmMeK6xOm/Vl7aiT5gNTHZvYMKt5AhO7GNmGsbXXsVMx6rZhXL+t2MH7T0Wz9QMUPw50OeQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(31686004)(86362001)(66556008)(66476007)(83380400001)(8676002)(36916002)(44832011)(66574015)(38100700002)(36756003)(6666004)(53546011)(6486002)(31696002)(110136005)(186003)(316002)(5660300002)(8936002)(2906002)(16576012)(26005)(2616005)(956004)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW9mSzZDdUhZdUJuUVpJbUtCL1hnY0ZOOVNaRmFvV1Q5RW5UNlB1ZUZ0WGF0?=
 =?utf-8?B?V3FuT1FTaUJqNG5mSWZTZWx4cC9ZRVlmSjd6aXg5R20wOC9XaFZlbSt3M081?=
 =?utf-8?B?dlBtV2FiaERsQTc4UDBDaVBEKzZjTHVWaUNFYjMzWEpBd2c3TmZRM2tCR1F4?=
 =?utf-8?B?cmpnMFQ4dU5YeEZOS2VZQitOU1poR2pueEJOTCttVVN3U3RsR2hyd3k5Q3p5?=
 =?utf-8?B?WVBRb0d4Q1FCVDBPaFBHdkxGZmxQbS9lL0FkYWtUc0I2TEkvOGhoTmlQWVoz?=
 =?utf-8?B?MGRQaEE5V2dISytmdThGN1pzd0Y3NmRCc09QMm5NNHNhaStBeFFVL2dlbUZZ?=
 =?utf-8?B?SDFmaVVqUWVRdnRTeXlkQW1adVdXdWV3Q3piT0c5OGVxRWIzM1FVY3h4RlRH?=
 =?utf-8?B?VW5jclVFaHFCZHIxY3JqQ3BKV0o5UHlTZjBxcUNmZjE3ZzhqaFdFNFdnNTdB?=
 =?utf-8?B?cUJkaVg1T2JtMVZDelg2YThtaWgzb0g5NUlKKzM0UDE0cHNPVGRSK3hkUEdW?=
 =?utf-8?B?b0wzTmo3SElzaGM1cnh4Q245TjJtSzUzMmtNWFlFa0tqK3J3VFpYYWVkeUNp?=
 =?utf-8?B?ZFRILzZMNmx2RjI2d0hYYXRxTEVZRWxpL253R01mL2paZjVwSXlaS3hreWcw?=
 =?utf-8?B?cmxNaEhZQ0NPaDFzckdxRWQzQnNPeWNnTlNOYmFqWGdock9QbkQ2d0krZ0F4?=
 =?utf-8?B?Z0tneDVRZjRpY2NZSkRDUnJxL0RjdFpCa0c5eW04bXVSVGdyaVh3aEFaWHpM?=
 =?utf-8?B?RFNSMVQ2c3A0TDVXRENhZkFOZGFyRG9ZRVZLNDRGR01vSzIvZ3J3SFkyZ0Ns?=
 =?utf-8?B?emlMdSsvOXJjTXRVVU5oNitWMEpRZVVRNVdZRTZrcFdrQ1ZzZ3pHMnhNS2Iw?=
 =?utf-8?B?Y0VZTG9LQkViMXJ5U1BEVXRQUmxBMnJUNVF2SW9wS21Tenh2UURld255M0RS?=
 =?utf-8?B?Y0J3M3BZcnBsME0rYVk1S0RGZDVYZnBhODBVWG9KQjB6dDhzYy94NnF6U1Nk?=
 =?utf-8?B?K1loQnlKS0pkRTdHZHB4T0g1NWZPcDR5VjFydjNTV2RnWkJlaTlUZnpCTTcy?=
 =?utf-8?B?SENUOHhtaXhIeWFHTFg0c1JUVTUrV05PUFFVYi9ycGxsQmxhcWdJUHdEL3dV?=
 =?utf-8?B?cEkwdVQwVWprVmw4d2JvTkoyZU9CTzNkVktBQkUzOG9rKzNPeTlaSHFxTlZ5?=
 =?utf-8?B?QVlCMnptTGRQbE1kaHZNdGpWK3ZsakhrY1dFL2tRM3FDbk5YR1p5eUV5cC9p?=
 =?utf-8?B?RGZFTUQzS1lwUStLa1lmZ2w5NjJuYmpmMzFOWEllOHFHOWx0bU0yRm4rY1lr?=
 =?utf-8?B?NTFrNHdBSThlbXdEbEZDdndZODdPQ1Q2eGZCZEVPSThNRVdNRmpyTThUTWpp?=
 =?utf-8?B?c25TM0tTcVBhWStxdXErYXZhbkkvSDBrOE41NDV0THBlQnZMTzNqYzZ6VUZF?=
 =?utf-8?B?U1hjV0w3S1BkWHhKNDlsTVh6bGRWek52QmRzd2J6Ykw2K3gvd3QxbzY3ay9o?=
 =?utf-8?B?TEhxb2tBamFzQWJZWmV3Zlhub0tIbkRKT3RmdmpHTE14dE5Hb0U0dWZJaEpw?=
 =?utf-8?B?Rmxzcys4RVYwV2dKUU4vUHF2RW1aeHJ4TEx6NjBON3V2VVAycW9teld1YnEy?=
 =?utf-8?B?dWVudmNIcWJwa1c1RG1EQ3lscnF4UHVnVWRCR0Fid0wxcGpWZndreE5Da3hz?=
 =?utf-8?B?Rzk0blhqdHVRbEhNOGJKL05TdDMzUUx0U1djZmtjMUYwb3R0Kyt2aDdQWTE4?=
 =?utf-8?B?QzVtVU9HQTFZZDBvMlRLNmNQT2tkSDk4YUJybk9uUHU0RE1SMGJEZnV4NGU5?=
 =?utf-8?B?Q0QyWjBmUkVrQVFGTFNxbnlzeitrNzBPK3R6c2JhVUFLVHl3L0ZweXRta1BO?=
 =?utf-8?B?V0xka1hwV0Q2bnExRmpkU1NmQ1R5OUxHdCtiTU5IRzdUVnp4NHJhZFFBZWha?=
 =?utf-8?B?WFRtUTRFUUhsVTRBZTg3ZzF4UlBmRjUxbGs3a294dnlWKzZYUkduWkY1K0dG?=
 =?utf-8?B?QkVDQ3p2TU5tOHI4U2o2RFpTQytFWk1raTkzT0VKVzZRSHRaZGczVmFpOGdQ?=
 =?utf-8?B?YThpb20reCtXbnNwYUZVSG83VEFyT3JOUlNGM0dEY0psbWlhSktYWEREUzlV?=
 =?utf-8?B?ejQ5bHIzZC9yaS9jejJuRUF6elhOS2t4R0NBcitqc2lqRVdWL3lhMUNOb0RP?=
 =?utf-8?B?dzNSdXgzbXphK0ZjbmlMRnQra0x3UGdFb2JCQ1pod0VRK1BPZm9UaTZ3ZWNl?=
 =?utf-8?B?ZXgrK1hKS2tnUjRkWll2VzVQV2VBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251f9d7b-929d-40b6-f9b9-08d9b59e8071
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:17:41.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COeAvnznYjM3kbEQT3dd5pc2t1tI4vyjAH6D2ulicfM1wuskeUzY0CoKvajab+12/rqT7AwhYYERoIWYRaiYA8VpSxM+iHnsIr5gSzWDDx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3202
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020093
X-Proofpoint-ORIG-GUID: e8KIbyNqfSL5XRaGtb1x0ftLx2ctwcqK
X-Proofpoint-GUID: e8KIbyNqfSL5XRaGtb1x0ftLx2ctwcqK
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



On 11/25/2021 10:27 AM, Daniel Vetter wrote:
> On Mon, Nov 22, 2021 at 10:29:05AM -0500, George Kennedy wrote:
>>
>> On 11/19/2021 9:25 AM, Jani Nikula wrote:
>>> On Fri, 19 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrjälä wrote:
>>>>> On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
>>>>>> On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrjälä wrote:
>>>>>>> On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
>>>>>>>> Do a sanity check on struct drm_format_info hsub and vsub values to
>>>>>>>> avoid divide by zero.
>>>>>>>>
>>>>>>>> Syzkaller reported a divide error in framebuffer_check() when the
>>>>>>>> DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
>>>>>>>> the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
>>>>>>>> the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
>>>>>>>> fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
>>>>>>>> vsub as a divisor. These divisors need to be sanity checked for
>>>>>>>> zero before use.
>>>>>>>>
>>>>>>>> divide error: 0000 [#1] SMP KASAN NOPTI
>>>>>>>> CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
>>>>>>>> Hardware name: Red Hat KVM, BIOS 1.13.0-2
>>>>>>>> RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
>>>>>>>> RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
>>>>>>>> drivers/gpu/drm/drm_framebuffer.c:317
>>>>>>>>
>>>>>>>> Call Trace:
>>>>>>>>    drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
>>>>>>>>    drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
>>>>>>>>    drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
>>>>>>>>    drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
>>>>>>>>    vfs_ioctl fs/ioctl.c:51 [inline]
>>>>>>>>    __do_sys_ioctl fs/ioctl.c:874 [inline]
>>>>>>>>    __se_sys_ioctl fs/ioctl.c:860 [inline]
>>>>>>>>    __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
>>>>>>>>    do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>>>>>>>    do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
>>>>>>>>    entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>>>>
>>>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
>>>>>>>>    1 file changed, 10 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>>>>>>>> index 07f5abc..a146e4b 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_framebuffer.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>>>>>>>> @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
>>>>>>>>    	/* now let the driver pick its own format info */
>>>>>>>>    	info = drm_get_format_info(dev, r);
>>>>>>>> +	if (info->hsub == 0) {
>>>>>>>> +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
>>>>>>>> +		return -EINVAL;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	if (info->vsub == 0) {
>>>>>>>> +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
>>>>>>>> +		return -EINVAL;
>>>>>>>> +	}
>>>>>>> Looks like duct tape to me. I think we need to either fix those formats
>>>>>>> to have valid format info, or just revert the whole patch that added such
>>>>>>> broken things.
>>>>>> Yeah maybe even a compile-time check of the format table(s) to validate
>>>>>> them properly and scream ... Or at least a selftest.
>>>>> I really wish C had (even very limited) compile time evaluation
>>>>> so one could actually loop over arrays like at compile time to
>>>>> check each element. As it stands you either have to check each
>>>>> array element by hand, or you do some cpp macro horrors to
>>>>> pretend you're iterating the array.
>>>> Python preprocess or so seems to be the usual answer, and that then just
>>>> generates the C table after it's all checked.
>>>>
>>>> Or a post-processor which fishes the table out from the .o (or just links
>>>> against it).
>>>>
>>>> But yeah doing this in cpp isn't going to work, aside from it'd be really
>>>> ugly.
>>> Kbuild does have support for hostprogs which are typically used in the
>>> build. The obvious idea is to use that for code generation, but it would
>>> also be interesting to see how that could be used for compile-time
>>> evaluation of sorts. Kind of like compile-time selftests? And, of
>>> course, how badly that would be frowned upon.
>>>
>>> git grep says there are only four hostprogs users in drivers/, so it
>>> certainly isn't a popularity contest winner. (One of them is
>>> "mkregtable" in radeon.)
>> So, can someone suggest a fix? A cpp type of approach does not seem
>> feasible.
>>
>> Adding the sanity checks that are in the patch, which are similar to the
>> sanity checks preceding them in framebuffer_check(), along with a self-test
>> that ran through all the table entries, might address all the concerns
>> brought up in this thread.
> drm selftest sounds like a reasonable approach to me.
In the meantime, should a bugzilla bug be opened to track the issue? 
 From this thread it does not seem as though there is a drm selftest in 
the works.

Thanks,
George
> -Daniel

