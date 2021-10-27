Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE743BED3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 03:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB5A89ADC;
	Wed, 27 Oct 2021 01:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2A089ADC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 01:13:12 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R0mr3U018032; 
 Wed, 27 Oct 2021 01:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Hs0hyMPPw68sloLItRa3P5+2SF8uFBGLJVI+Rp+yrgs=;
 b=QtEBSeDjt62lOQCGNVcsxQLkf+pKXdj2eDXeJkqJX2SN0NQLYf8YQd7l0OxFwHsonOPx
 ROGAwKKwdJiSj17bWoRNQSiR5DEY4jQOaPLNVprNdQBA/mwsWXFnqA2MgWXt7NaD6gZ0
 p7vnrILpG0Gh4q8VGHx4MPMYEfy1lMSQV5v0qQtYREwwsj9ZNU3TJ68w0KUWcaSCBV3k
 o99homRBL++OAc2FBcPM3xoFIVeBQabvNxAzCD2nxrGYKreHlx58UGG+GU5Wi8iTSvmM
 h8Ghxd0BuTdQxAMLZMhMNDgiNC+VVLElMOu7Y37Z/FJNMjt+JtXkAyc2vDHiFIdqCjUE Ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4g175tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 01:13:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19R15WJL128452;
 Wed, 27 Oct 2021 01:13:05 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by aserp3020.oracle.com with ESMTP id 3bx4gbxa6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 01:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBbfvoqATX7yuT9LXPsdWSre6DT++I8t4KzNi94h39SLFetLEVl9Ah1gz7LeVCnIxIpDZAugnK5jvyC+ItMkGXBXjZ2MxeB1D5f+m9IMHElmF1u057uehfIBxtacj6BiSa6q8q2dRVi2+9WaP7X2vG2rAak/9rC4d8vlbcxZEcN39GMQ30zi+rBpv3OTjXUUHmUXsI12HxWk1uG4RHzixrJPmDcfEirh8Bn7FEAfoGCK8bCBdHWEGs4O1eTgkKasJD8Ota5+FpGmiPAvCi366hbODflhsHUier8QXqKXFfEpy04mQqBjEpcOZm6sj8dxSZSDlqWeTfTcJb6d+WjN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs0hyMPPw68sloLItRa3P5+2SF8uFBGLJVI+Rp+yrgs=;
 b=HJyMttzH/fFOCYT36oETdyiZu5QLwuLgRWCm34GxitKmaLMVwXCpCz0GOtVJ9+Vv/FZAXPhjXiJ1FxJXN1vqypdrXlJy8cn8r02gQTuJrcQJWoMDdAZX5NU8sZMnpdbxWSRiQhkwwne4TF/4h78YMAg/7iHHcAzJJoQmOdi295hRY2nmZhyLIzspUb27MLU7ppUC+T0faoDjasOWEKaeEMbf5Qb13qd/u9LO86vXSNF4oVn6Vbvq66LJtgOXdGVBT+c5wKfO5izUs+WOx/rC1bdsTE/T/7kgl42iW7h1NCuE2p0kZ3CDolHuRKeLs1PDOPSPP4W//BbN2mEJxuGmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hs0hyMPPw68sloLItRa3P5+2SF8uFBGLJVI+Rp+yrgs=;
 b=vkA88+LgZLNnwUXStBq+ylbMx6+eECuQKLlGd0jq6sZeVNtWRaFqBSbPm75SU3bS93Lt1zSWWD6UP4GpwBjm+hds4H0cBEAxBjdewNVSoyWuD35Vf/U9ppVde5+2rB6RXUi4lwLBM0ggMrrBxqeGw74VFJ/8qL/WMRr8+PBTNec=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN7PR10MB2722.namprd10.prod.outlook.com (2603:10b6:406:c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 01:13:02 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 01:13:02 +0000
Message-ID: <4cf6a155-85b7-649b-066d-e56da87dc8fd@oracle.com>
Date: Tue, 26 Oct 2021 21:12:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
 <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
 <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
 <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
 <d2119d59-89e4-34aa-86df-38fee2a0c6ef@oracle.com>
 <CAMuHMdUZq00r7QYeAKGm36UKpGwH_uEGMvwHBzRi9_nxV-dRhg@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMuHMdUZq00r7QYeAKGm36UKpGwH_uEGMvwHBzRi9_nxV-dRhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.233.94] (138.3.201.30) by
 SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend
 Transport; Wed, 27 Oct 2021 01:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2bcfc88-0d83-4c67-27f4-08d998e6ebc8
X-MS-TrafficTypeDiagnostic: BN7PR10MB2722:
X-Microsoft-Antispam-PRVS: <BN7PR10MB27229ED2D655CE97CBB0F234E6859@BN7PR10MB2722.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oa/ZSUhe9GZA84Vr73KyfYDubh2+lYkGK7HUxaKaquHypSlltOOGw8ShY1AH6P8P/YCHH/K77QEpG9z6cSO9D0SVQL7n3sjThaxFdQtFoWoHaWKUnpAXkAyslYLUQgHbXT+lofbibOVPxLomk6zfZrAEWeViX5R34o6YmjPR1WUOWbgEjxcGHAtQQIK+fusmOoG5Q2KTvJub1rf9bdaVAruEltngkTEDtK7EzPJPmfUvYrVROvEeBMUI/D0b3S1PwsdPwhHIkn/Nntu9o30BD5XtHNRh8DGzvU9IzmBRTICTWsmwik0cTwtvvBXu+gTCOfXRyE4ttmeoBliqWEUYD7fMgQho/WX+G2zhrCi2YjQhKnS5GteUhCOXPxxTc4lZ39Fo8wncaTcwkAf8NgvE7f+gWOdRcHxtQX6/uguxs5bgHaAQcXo3pYUOiIpQ8g46YOUjD38aPXgE2QgV1RO3lP03Td5lYI05af8Zxht+zy7cca8rn8361No/070S7iK3oeeF4+lmdxjLFjTP66D4wY+UfzR/BUZQOjXstZAzrj23ed56ROHSVwnsnYvt/cQk8LEqA7ExLRXKVhl2a/KNYTZ4ify92WbQfIveqKjgnCtSsweSEK9bP5s8KXECpIfir1thY8IC4Vs4/hrJ+ZLzlYiSTHA8ezlN1AnAlqA/A0ShZX+bxr5Dx9zNpvxVLKiz6/AH2xujk5LiJbTORYvi5TLByg1gdBWdGPPxlQ/Ukzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(53546011)(54906003)(316002)(956004)(31696002)(16576012)(6916009)(36916002)(36756003)(8936002)(8676002)(83380400001)(44832011)(4326008)(6486002)(508600001)(2616005)(38100700002)(31686004)(6666004)(86362001)(66556008)(66476007)(66946007)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUIyUytlMlR0Q1ZiZTJZa05mbk5JRUpJM0VTMnhuSmxhWlJaNFE4L0tJemw0?=
 =?utf-8?B?TVNidWg4eE5BNGpaQWlTTHZTQmxab1ZseGU4eHExZE9NdW1ZNEZhZFJETzUz?=
 =?utf-8?B?NUFwaEpCMGs0M29FVHRQaUJqNHJkd0hiUWs2YlJRbFZQamE1SjRzMVcxNkJW?=
 =?utf-8?B?a0xBNkM2TFBuTWF5M0hSWDVjT0dvNWR0aHREM0YzVVl6MTZBRDlkcFFFdThl?=
 =?utf-8?B?ZUNNZWlvOUtBblVtTFU2SnVOcG91ZWk4djNGMDMrNHFBa3lSN2hmcXlHUWxN?=
 =?utf-8?B?Rnh6TFBZZytMenV3Z0lIOUV6S2NFd2ZxS1VoYnVBMkRMWGsxd25LZGlSaWtQ?=
 =?utf-8?B?TWc0QlllckVuNWJFZUZpN0kvMDhabU0xNUE5bk5Ea1dkK3h3czVMT0lBWlZ1?=
 =?utf-8?B?TFRpT0gwK3QxU0R3Q3BsSnY4L3JqWjZwcmNMMndwY1lNUGYvT2Z5eXZFRURY?=
 =?utf-8?B?QmtBMCtwYVNPNWoxajJZRTQ4bGtHbWRmZk1rOXNSdlhQTGRkSko2N0lJS1NE?=
 =?utf-8?B?cUxTcldRQzFrdHVBWGZHNTR3TldxazljM1dFcFk0eFFqbHp0ZXVUejFuMkFC?=
 =?utf-8?B?UDlsdnI4aG9XRzdSenIwTDRlb3VyeVBDemJCT0w1TTlwL0I1U2JwRGlvME4r?=
 =?utf-8?B?QmFmZGhySzUya2EvY3A2ZitTVDNha2ZFeGlwVUluVmlsc0RpUmtXeWxmWHdy?=
 =?utf-8?B?dlBvZ1RueWtFQ1BDQUVjT0tnQnNTTkFwZVBOOUxPWW1oWlUydjB3STMxT2NV?=
 =?utf-8?B?S09VY0JUZ2FXOURDSmdHaGR4MjJvYUYza1dPajdaRkV6Z080d0haU204NVFi?=
 =?utf-8?B?aW5DRnZ0RVhaKy9xazExNDU4a1puUkYyTURVMThZeVRFZHlrWkc4SGVtQXI5?=
 =?utf-8?B?L3NCVUs4QTkvaVZKZldsNkJNNThLSlBzak1wM2xxYVh4ekVwUG5uK2lSd1l1?=
 =?utf-8?B?bGI1Y0pBTEI0UHM5VVgva0NRWTIra2o4WFhLZkNVTm9ZSldBSFhTWGdsWXNU?=
 =?utf-8?B?VEg3YkdaWTNtUmxaL2xpTklmNEE2MzlJdmlaRDNmd1BrOVR1aVRpMUNvMkY2?=
 =?utf-8?B?YWo5VXYvM1d1em5UK1hPaE5hOUZKcmJ4VjJCSkZHYkg2dnYwckVQTDlySGRT?=
 =?utf-8?B?T0M5Q0hYeHQva0o0S3psNlhIdm1kcWsyZy9WWnlpSmdyZWRiL0gzbjZubHA5?=
 =?utf-8?B?UCtUQ2JjU3FsSzVZcjlUZXdJRVJFVzB2WXFJeU80UExxZmVkamFSZ0VKZmc5?=
 =?utf-8?B?Z2F2VzFxbzBFMjBkM0c3NzdNZnJiR0Q2SG1xVTM1d1pSRG0vemp3K1Jva0Q2?=
 =?utf-8?B?ODY5c3hVWHZyRU43dHpScnVxdzVieFJiVkRvZUIwSzMvcnpmVzJtZkFNc3ZU?=
 =?utf-8?B?SmEzc2tQd0dTTmFDYVVCOENXc2JLdExJSThidmthdHVkQ2FuUXVIcjViZi9X?=
 =?utf-8?B?TXNRR0d4SWw0blFjVUlsRHloTmFMY1JSeEF5dDEyWnpFMGtzOVZacTk4V1NX?=
 =?utf-8?B?VEpKY2VyOUEvUXJvRVhoQTF6TzZML3BYTnZRWXdqZVlQWlIwUytaUytsMTli?=
 =?utf-8?B?U3BFeHNOYyt4QjExZ25qWXh0S1lKdU1nYjNWcGphS3pmZUtkU0NaRW9ROWlq?=
 =?utf-8?B?NTA0SEdvUXpvVG5lNjg3MUM1azBhbWRMcG5PcnZtaXBTb0dtSDZjb2ZHeFlE?=
 =?utf-8?B?SXluYVc1czEwd0dKZHo3V1RmWVR1cTdlRXJWWHovQ3hGamJ2OGxPdkppT1JN?=
 =?utf-8?B?UUc2WmdRNGNvZUQreGtuTC96RDZuaFlWUUpBUVhKTjVtakZ0N2lKN3c0eVk2?=
 =?utf-8?B?dEw1UXpKNktmRExqb2N3YU9wVnRLR1BMck93SEJ4NEdqNHFpSFN5V0Fab2Zm?=
 =?utf-8?B?c2Y5RVlFaE4rRkxzK3k2T0ZqNnAxVUdNa294N0ZaWUdXbkFsaS9PZ01STlIr?=
 =?utf-8?B?WVFyaUFDcG81VlFRclNIdCtiV3diSlBMcVh0dU9zNW0rSmJ6V3NLNzd4SEdp?=
 =?utf-8?B?dSt5WEIyNHFPSzdIYVNmY2Q4bDQ1OXJWcnR6ZUp2SW1tUHdnTWJZTmJkWm1E?=
 =?utf-8?B?cE5YVWpOUUhZcnFDM3p0QjFNZGtkdHV4b1d3a2xMRjlDR0NKN0tTYU9SMzVB?=
 =?utf-8?B?c2ZaTzFqQjdZTi9SRml0L0FEVnlsZTZpOHhuTmlzNDQzbDc4MlpIdnFtU3dQ?=
 =?utf-8?B?bUZoUUwrdmVnZVd4RE03cnlDZlUybWxZaHNyaU5UNXg1QnFXUTJFSTg3djB1?=
 =?utf-8?B?Q0VlckRPMFlqMUdOVWdtQzZ4WjB3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bcfc88-0d83-4c67-27f4-08d998e6ebc8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 01:13:01.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1Klb2gvBq8bk97giTyybBhW/pZ4PW5fPyI8oLMkmhGI8R7y2E+RRYQJY46zYMR1G7re39dREY0ddU04xZjV/poDwaIbdZYUo2eKK4y7tZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2722
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270004
X-Proofpoint-ORIG-GUID: a5k14Jr0i6BVqhqbg28r8A_5wYrwCfA5
X-Proofpoint-GUID: a5k14Jr0i6BVqhqbg28r8A_5wYrwCfA5
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

Hi Geert,

On 10/26/2021 1:12 PM, Geert Uytterhoeven wrote:
> Hi George,
>
> On Tue, Oct 26, 2021 at 5:48 PM George Kennedy
> <george.kennedy@oracle.com> wrote:
>> On 10/26/2021 10:11 AM, Geert Uytterhoeven wrote:
>>> On Tue, Oct 26, 2021 at 3:38 PM George Kennedy
>>> <george.kennedy@oracle.com> wrote:
>>>> On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
>>>>> On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
>>>>> <george.kennedy@oracle.com> wrote:
>>>>>> On 10/25/2021 3:07 PM, Greg KH wrote:
>>>>>>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
>>>>>>>> Do a sanity check on pixclock value before using it as a divisor.
>>>>>>>>
>>>>>>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>>>>>>>
>>>>>>>> divide error: 0000 [#1] SMP KASAN PTI
>>>>>>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>>>>>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>>>>>>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>>>>>>>
>>>>>>>> Call Trace:
>>>>>>>>      fb_set_var+0x398/0xf90
>>>>>>>>      do_fb_ioctl+0x4b8/0x6f0
>>>>>>>>      fb_ioctl+0xeb/0x130
>>>>>>>>      __x64_sys_ioctl+0x19d/0x220
>>>>>>>>      do_syscall_64+0x3a/0x80
>>>>>>>>      entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>>>>
>>>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>>>>>> --- a/drivers/video/fbdev/cirrusfb.c
>>>>>>>> +++ b/drivers/video/fbdev/cirrusfb.c
>>>>>>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>>>>>>>>         struct cirrusfb_info *cinfo = info->par;
>>>>>>>>         unsigned maxclockidx = var->bits_per_pixel >> 3;
>>>>>>>>
>>>>>>>> +    if (!var->pixclock)
>>>>>>>> +            return -EINVAL;
>>>>> This is not correct: fbdev drivers should round up invalid values,
>>>>> and only return an error if rounding up cannot yield a valid value.
>>>> What default value would you recommend? Here are examples of some of the
>>>> possible cirrusfb pixclock values:
>>>> 40000: 25MHz
>>>> 20000: 50Mhz
>>>> 12500: 80Mhz
>>> You should pick the lowest supported value.
>> In bestclock() the frequency value ("freq") is not allowed to go below 8000.
>>
>>           if (freq < 8000)
>>                   freq = 8000;
>>
>> If pixclock is passed in as zero to cirrusfb_check_pixclock(), is it ok
>> to then set the value of pixclock to 125000, which will result in "freq"
>> being set to 8000 (or adjust the passed in pixclock value to make sure
>> "freq" does not get below 8000)?
> No, clock rate is the inverse of clock period.
> So the smallest clock period (fb_var_screeninfo.pixclock) corresponds
> to the largest clock rate (freq in bestclock()).

How about this?

This gets the frequency derived from pixclock to maxclock or rounds up 
pixclock to get the frequency as close to maxclock as possible.

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 93802ab..2e8e620 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -620,6 +620,18 @@ static int cirrusfb_check_var(struct 
fb_var_screeninfo *var,
                 return -EINVAL;
         }

+       if (!var->pixclock) {
+               long maxclock;
+               unsigned maxclockidx = var->bits_per_pixel >> 3;
+
+               maxclock = 
cirrusfb_board_info[cinfo->btype].maxclock[maxclockidx];
+
+               var->pixclock = KHZ2PICOS(maxclock);
+               while (PICOS2KHZ(var->pixclock) > maxclock) {
+                       var->pixclock++;
+               }
+       }
+
         if (cirrusfb_check_pixclock(var, info))
                 return -EINVAL;

The work can't be done in cirrusfb_check_pixclock() as var->pixclock is 
read-only because "var" is "const struct fb_var_screeninfo *var".

Thank you,
George
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

