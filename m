Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691A47870E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408F510FC13;
	Fri, 17 Dec 2021 09:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072A10FC12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:28:53 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH89AJv009354; 
 Fri, 17 Dec 2021 09:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=4ovKP5juOUip4qPZ07ZNPHU7J/Gf+byKn89eAoPT6xI=;
 b=b0t09iDGOuzNDfUlbrKd+0FxCpNTebtvsMpREVP03B7JbdloE/EwBeXVIJoONKNWWJ6Y
 EQBRTWNKtYdx+MROVfDUE77vbNvV5Wdl8xmv46twf6H1FwJ2YgDoRRG1STIdFwUV6aec
 t1qv8ALkPTaA6U/wYy9VJ0jr8SWx+5OEb18o0f8WrcU3v9aZyUpY+hXBgaoa4gjozMje
 2e6Bf2chMgQ4iiqtyno8qqiuiTBvy9aJbqac6sQlmF5C7Yp+HJUsCOGiTfYh+/gQgIKn
 hCTrYWxIwrBOp4s6vmClVp3J9ZxSudMtY6d68rFKjqXX+WoA31NfKIzda85O4uxNiKAu 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknp582w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 09:28:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH9GcLV172318;
 Fri, 17 Dec 2021 09:28:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by aserp3020.oracle.com with ESMTP id 3cxmrer189-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 09:28:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gsjg4i3y5cFzRw7Z4AgH/Go0jsSRLfCBHwyCcSs+sKEit8aTwiJCKq0kCWupFJSVQoMTuWCwb0+kbus4Tc5hio6kkxnYnpzv479rJ5TeVQtpws12D7gxWnPhks5RY4HyhVC6fAScOPx3J4VXoiQVt5OfC726aeZqryBNydsXFRRH30tfZ09wqNYuqX2sJsWFGg5tptIelTK7vD3PM5ALT1jdFPx3gGw7crrYJoy4UvAhu8+Yy2rpxNk4ZEMgxFysXOml9+/ZAPNm7KCtvkvifEQwPGRs7AIJKNJsk4Gz9F70YB4rwXTM507cDk8y33ePvOk0hsKoVN+xgxlT4f8M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ovKP5juOUip4qPZ07ZNPHU7J/Gf+byKn89eAoPT6xI=;
 b=iU2uGEBjJgAXp0LsBawbPYwtO/r+bai0UexC3whG60clqwBb3HAoC26msR6DCOBZi6x+aE2NJvaFLefNK/tG/ZvUXNABpEngvh25l5FAVIC2TVIr8ER196o163SaG13D9sMtB9adyQaAx/SVFGlZ6mzX9YPK8wRk9HJAlCOUzZRiHkPY0NdVnbxsKbrqGj6mT8nX1+IycaU55nTAZCtMVY5coBhrw5g0f+AAVWigU7q+qNrUQ/XDRRTt7l35JrSREYJNXfLAa8x23QO1d+4mqQgSH04JqhUmEAjHPwpF+wZTHfZV4TgDodGnLv4sCp3Ska4QUYYpXm4LV9t9farDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ovKP5juOUip4qPZ07ZNPHU7J/Gf+byKn89eAoPT6xI=;
 b=lN+Yq+iiMf77pb4k4N57bTFPQe40LwkpoEx24mjkEJKhdt3sla6MSxhnstodTrPS74fKxOGW51TgpzMB1PUUzDZQrNXUp4Io1CofVsG9oWf4D2OhuTeT7G3V2LhFvFoUEbyHMskZgESyYfWrwq3Cxzeb8r+Lj2WK+mrHJ2378jE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1488.namprd10.prod.outlook.com
 (2603:10b6:300:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 09:28:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 09:28:39 +0000
Date: Fri, 17 Dec 2021 12:28:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
Message-ID: <20211217092817.GH1978@kadam>
References: <20211216161603.983711-1-steven.price@arm.com>
 <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
 <4c564c0d-7702-9dfe-910f-969fe130aba8@arm.com>
 <20211217091046.GG1978@kadam>
 <4e56a7a8-c48c-49dc-6535-730ad871d1e1@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e56a7a8-c48c-49dc-6535-730ad871d1e1@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d14dd3c-5cdc-4d07-a481-08d9c13f9ba0
X-MS-TrafficTypeDiagnostic: MWHPR10MB1488:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1488691E42561C1D299CB6948E789@MWHPR10MB1488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3taJsdgOq3XmCiw4lvuSe7qWOUzUp7LdtkN+Cz7o4bdNy6QgMXBWb7ElqLlrmcj3K0aO4L/n/3GK/45XO5C6n1XZMzgLp3Acrbt6aTFhgCqGHWcc9R6ynsxkCG/Gs0YFx4rs2QTnq9JnDHsk9ZRTVzhz/RVcIKhrLF6R0gMOScPXrxJg2ZEzPflioUzaNUTiOhFdVyBLIPwCDzmSykWjyIypaMjXLn3Zqy5kZiRz2pkr6b+nSGNVxN5aHabW/hsH80MCh1mz7h0bEWAnnNsR8gN4oezPUuc4z9FTLGmo/7MCbo/Qsg0k8yZv+0t9lcDyHv3I4oEIChTxYc6bW38tVdz1ov2ICZzFYP1H3sXDRWkuaKpK+dtedE8gWc8RdVIA2rRudbhwbTO/gcwpG9gLPlPtVNBdgvUajhDudaNQ8KudIGjGEZpQS3HPspbPtTOp9ZV2fkUzBbu0y5Xf6sAFMQMIoSMVVfNU86RkP6fly6pT726ieWFtws8uvMdrJjflTo4tKUtlTjKmefewq4kXsbL1adL2by1rak9qsP6n7hhzg/7wglLiYAsP3f/T68vxKiyrqbhZQuFhDEDXXvVob+kWF5FBda1uAbf3eXYLnZgqcCuzs2s2R9cknnRqde/T1LRtiBvYRy7QLrYLjooUjfCREBffgawyA6fTce70OPwrBXnE9VqJlwl8yKJRDNS+4oAhPEmsD4nuLbUIbf5g5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(33716001)(316002)(54906003)(2906002)(44832011)(66476007)(8936002)(8676002)(508600001)(6666004)(6486002)(186003)(66946007)(26005)(66556008)(52116002)(6512007)(4326008)(86362001)(38350700002)(38100700002)(5660300002)(9686003)(6506007)(1076003)(53546011)(33656002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9/rCFRlPvZr8E8Sm3hCaVbifTQqaeG6TphyGAR1Cc3pTSFEFIFsyBrayifX?=
 =?us-ascii?Q?T94Qb+aU+if0RDW7R7MatwGpU50Tyow2lILunIXRPUFDVyVfj53YhXILOmgD?=
 =?us-ascii?Q?U3lRdruhNDD1Aa0UUzLkHXGJjxR227CP+94Fz6tp8sSHccYqPIDyW2JnsLwv?=
 =?us-ascii?Q?qHG9LL4db8s5Rdp8Ur5rDzWR38nnd5pr7B9d3noX3LBRCwlV6H6qb92lHoZe?=
 =?us-ascii?Q?R6JN5jG6UD3OIa6iY7ioD52V3FUOyrceqmUxgb4mxdgAFAgyu2ys3oWRtl7F?=
 =?us-ascii?Q?msbbGEIr+sZ5ITcPFya9YkVidDZPS5U9reyHUbZAdemA3znLjEhCkU26NMh3?=
 =?us-ascii?Q?Q7u4jEjrtGA1uN7WsNZmngoQdSMdAsuWOrF3lQgDH0LcW5abgIqfGUiNIj/+?=
 =?us-ascii?Q?KbPOx/dLha/G6Vn3ZbuC7vLfWSaM/MzWVS/ninSDuI3GpsCZCmpQJy3KNSBo?=
 =?us-ascii?Q?41o08/+1m038/0lcNFP3XpZlyXn2j3mI+iUeyj+Tmdx/Py19E8VcOGghfez5?=
 =?us-ascii?Q?EXkNAq+k/OKndivgU7c07WJFSfpU1QEsEv2Get2eYXhp5a1Yf70+2AiRVA0C?=
 =?us-ascii?Q?QB8RvqgvppV+vNInjXV57mHHIb6tv0dIF3HqC4FJ+ZpHrgQYqzsb2EbHuA5o?=
 =?us-ascii?Q?Bk/drfDvqsuL4JD44qIefHIZuevBq3GrALCsllAb7Z9GvnVa4zNC2hOHi9gR?=
 =?us-ascii?Q?wrAtkYHwXGI7VD1cC8xfOBMHcGvU11Ph9EFDZ6g8K6M/78DyOBFElj+lNJ7u?=
 =?us-ascii?Q?z23pJSZy//ok14IKBZkRZ98bYKqbmJ6RtmlVSLBb5QvLRoE+p61VvNbqKUif?=
 =?us-ascii?Q?zXUwXiQ9hJRaAhur3PUFisah/6hSBOhIlgs7Ky6wsTHtXkSIkKi5vyUhn9F1?=
 =?us-ascii?Q?66l41/Gr67CL0FJqXVYY7FAWQTx+hztttPB4uAnd8H2mS7hQ50iobwBozSyu?=
 =?us-ascii?Q?CU5UMbL7GBwxvFVtrxKBPV3kc4y8W18U2Km7iELvRr+pFuS9/ZGwmknzZDZ4?=
 =?us-ascii?Q?QfCr8cyhbYJ3KoA3iOYwHdDSDT1yRvLUbB4eCmI+LcRd87beSNHcFVIfb+5d?=
 =?us-ascii?Q?aFFIVHY2ISyvsWPDTY9ahngBnybdjDv7ROF+zSwp8z96sNVWG+27udGsdzC9?=
 =?us-ascii?Q?hZByWhm7ZelYCgawJcr++OtoQ5ay+wWzwqzGgWDFAkKXtJD4mYWhaVTyblxK?=
 =?us-ascii?Q?AQ+rOc6rz4ffnlfNmZxCHAsSQqloDOEO8XKa0THnLIJ25+pkExxF8QAzv/ua?=
 =?us-ascii?Q?g1ZeyqIU9PypGiisCVlEAfznHIYPIR/P+2qTgHg4n6lmWVA+F6MQNHF8cTxz?=
 =?us-ascii?Q?EcKrRG8777vmMnoilRMOjnOu5iHanQd66KgR7sHElCdhu6o/xNgFMnV/eGl6?=
 =?us-ascii?Q?sutgFQ9UNmSFwezunViE4IjqOzbK+0oemOi4Zc1yq0TdutB2bmTV/UUj75QR?=
 =?us-ascii?Q?l5BMOsj9Ck9ASOH8msjbUn0rA2kBwsnHy4yB1C9XxO5ptxBgLpAn7BzVGQxh?=
 =?us-ascii?Q?haOyHgUQR0KZI8STPA42PZrNnBASAvjCvLKuA4uDqPrgnoQJv6ny6Wm+cYZD?=
 =?us-ascii?Q?mpxkJ2xmP1eSQZiazRSce3rUosTiffBSdDDQHZXqvjPwbtbk3uUxF/hcC+uo?=
 =?us-ascii?Q?SGeZW8QkzLFm7Oc7wCP8HHA51zoOGA9EPj/X7cHm6qNIoXQxorDtLDjzIz0L?=
 =?us-ascii?Q?wRHJJ3ssLEXAlAmbLltov2WRtic=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d14dd3c-5cdc-4d07-a481-08d9c13f9ba0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 09:28:39.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTn7BxqopJEc5ZkiKndBk5K0y4ENee8qkX/t/ZZd0udz5NuDYpyWJ2W5CgrPpFtfWTfmG0QPu7nXKQrcwdfzkAZtsOoPDFSeEkN16ETnowE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1488
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170053
X-Proofpoint-ORIG-GUID: TqCtT2QomP1QsVerGC-uLQzHi0uw_6GZ
X-Proofpoint-GUID: TqCtT2QomP1QsVerGC-uLQzHi0uw_6GZ
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 09:16:19AM +0000, Steven Price wrote:
> On 17/12/2021 09:10, Dan Carpenter wrote:
> > On Fri, Dec 17, 2021 at 08:55:50AM +0000, Steven Price wrote:
> >> However this one is harder to fix without setting an arbitrary cap on
> >> the number of BOs during a sumbit. I'm not sure how other drivers handle
> >> this - the ones I've looked at so far all have the same issue. There's
> >> obviously the list that Dan already sent, but e.g. msm has the same bug
> >> in msm_gem_submit.c:submit_create() with an amusing bug where the check
> >> for (sz > SIZE_MAX) will never hit, although the call is to kzalloc() so
> >> large allocations are going to fail anyway.
> > 
> > sz is u64 and SIZE_MAX is ULONG_MAX so the (sz > SIZE_MAX) condition
> > does work to prevent an integer overflow on 32bit systems.  But it's not
> > beautiful.
> 
> sz is the result of struct_size() which returns a size_t, and SIZE_MAX
> in case of an overflow.

Correct.

> However the check is *greater than* SIZE_MAX
> which will never occur even on 32 bit systems.

You've missed a part.  We add ((u64)nr_cmds * sizeof(submit->cmd[0]))
to SIZE_MAX.  If nr_cmds is zero then, whatever, the kzmalloc() will
fail.  No big deal.  But if it's non-zero then "sz" is larger than
SIZE_MAX and we allocate a smaller buffer than expected leading to
memory corruption.

Btw, it turns out that I had a hand in writing that check so hooray for
me.  :)  #HoorayForMe

regards,
dan carpenter

