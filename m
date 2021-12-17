Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA84786C9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55E10FAA6;
	Fri, 17 Dec 2021 09:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773E810FAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:11:20 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH8H4c2004111; 
 Fri, 17 Dec 2021 09:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=dLpCoA9vpKVEjJhzhuCqER5RH7QKOcUkoMyBZj6tyHo=;
 b=aW//O6/7dfzrypZlM+7xfVRf8Vr6MiTE4XAzckY/fbD9aDYoY/H1Z7+5eNM4/56ID3R/
 iabj40r/06Qbw0zO/2PL5ZrepfWW0VbCJLunnwQOSI0AdWMCQVvZ61L5tx/B0Wqm9OZD
 qXKt+RmL+mPKUtk927WKgoA9Fy4//gJs8zk64ZTdwNaUw7KMb8pOqcHGfMG4vyMMsOGr
 xwGiax4n6M72xEBNJmkhN+3Hh31JPkuGxd3vWLjL19olvLMPwKRVQlvRHuMkWFDe5lFs
 0C5z+fSZLTrldnuSNY06bqBZrs9zbTiCcIdB+sojAJnVVrruFP9Y80ZaEIsTVChL//rv KA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykmcn32p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 09:11:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH99vRc070606;
 Fri, 17 Dec 2021 09:11:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3cvnev9xa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 09:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaPkWY/PUrW3/VVFGkd5sgqL0OgfAVc7eltPPB5cK7ptHkGCKlBmIvZ3/8gTzpCNos6nOc62kKWsUOXd2MqUy5ZZjf08XTJn6p24II+p0J5cLKVfQLRPEeL/57RXHoYwA7Js0NHqi1AVS7de8OvvW+K0ZSbEwTlc6iYUk4FKzWlV138KVVSv+Ve/uPGNZV4OeaLVc9naNB5tysGjLEHFtuNaHve0oUR3XM6Winl+VVF3Lo94wnPdZzVew0Gp28b920+9xgPH5AIpInhnRyX+IGgXXoOrmRSNUJn+LkTVYBZdq1XTH7y6MkdNdHfzxFk28NGdYa/YoTNAfCm7GxeCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLpCoA9vpKVEjJhzhuCqER5RH7QKOcUkoMyBZj6tyHo=;
 b=YaitXZMv3H7NgMWL33HivMZNkljSsMzMFqp08ijC3Ar/1EAnBpEiUCNp7enGXEYbLDFJTzjPzOSwwJ+ulofbi/aFlPRCqjIsyXx10B/B8FYRrxSLTfOty7g/choUtebg+eM6RZlYrBd1lXQV/F0qxO9Wlw6Wf3GuPmKHaHK7QyPgIzk2loNIRY+v4ENR1o+7FahrAgmBDsVEdhANdO15DirOPEsX6Tcmbvo0nEDiiEKFe2rXTMw735E/6y8TJf7rpYAPOuDKsBN6iaI5tmvXSaqTfa5+1aQ+OiOTA0XB9aijeSAMsog/adgYHg07Up1n0n52GweOk688xovOCCjjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLpCoA9vpKVEjJhzhuCqER5RH7QKOcUkoMyBZj6tyHo=;
 b=Du7SLFgH4Fi1URzmk5bUcsxZT+gOA2en3nmOtYwH0wV/zXz/Q+fqr5KbshbA1vNHfXwhCkjDR2PKCumG6XkGKinL9PI2iumf+8red7u1XLdi44DAD1nKvZqgLer0mCqk7AYSffDWG1b0/RhGesj7z4KAvR3liqu+WQ0VupGzk6c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1565.namprd10.prod.outlook.com
 (2603:10b6:300:24::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 09:11:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 09:11:09 +0000
Date: Fri, 17 Dec 2021 12:10:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
Message-ID: <20211217091046.GG1978@kadam>
References: <20211216161603.983711-1-steven.price@arm.com>
 <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
 <4c564c0d-7702-9dfe-910f-969fe130aba8@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c564c0d-7702-9dfe-910f-969fe130aba8@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0015.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 000e5766-4c84-4b71-2c39-08d9c13d29ea
X-MS-TrafficTypeDiagnostic: MWHPR10MB1565:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB156532DEB19C6C19E1A321758E789@MWHPR10MB1565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +945pLoDBPTZsxKzoXtTvBEtLGDXAgszFSqk3VAFrkGDFcJaJDUZtzY+3KDEHGAIgK16mLPEzAyVeBxgrpNnSDgYcq7iB95EH/uc55yr65Z3Y85rkJ3UeRrJPpt7KXvKEDpz+LmNdcEuNVWUG9fRXnfLusqbvAAXl2JoTYffG0A6+nfk1o/Mjhrm8ZHDtVo+UNzGTKDfidkPy3IvT73cEg2lG/9ymx2pE8mriW2gG2kXFDd2G4nBFAx5bI4aOVAUlXpIlZEfSqbpo0YmFryT/cG4zUmHbiXL+9v5OOLmB3rNJDp9XgS65sX+bPKhX9l+TsfE+seaS0BZ/UU8hxwtFtApeYYOsrEn9TvY6qO8CBHn89CA/KeShK3A/pJFCbps5BDK8XZDERGFP/IjFhPdVbvuOIGTFKoFbP3/8VILzmBoG+b2r27TmXAfaiZtu8vcYFqw9Sa+MzqMVSXnD0ERsHhYIPaSzs0krj4bBjgZvnTUAQ9kKv2LDZThX+cJedZ5DbFmd+/FIKmRhbVj2BrtINc7iwcgTTtQuQCNizWjwrxIIzBficW581yettbw62/Npni/d7lF3z1clNc4tPL3+kbqnWafZ7S3fuyLj1OCTskN565Yq3pkjtbLRcTDbM2bckC+/4alSwZNAWpJpjqZmnxthnRjsoJyd7fDTlWsMJFM/2GRScmew+zmMu3fV3aRxtLXDN4nK7+mO9FeYUXHtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(54906003)(1076003)(6486002)(8936002)(4744005)(52116002)(5660300002)(316002)(6666004)(66946007)(33656002)(508600001)(66556008)(66476007)(6506007)(86362001)(2906002)(6916009)(4326008)(8676002)(33716001)(38100700002)(38350700002)(44832011)(26005)(186003)(6512007)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8SeSdSzrsXDJSa+92A0b6X2jwvtN5tB7K4HTPiyTvhmQdYXbtj8kxZInfmP?=
 =?us-ascii?Q?+6pUtOZTWkFRyQyqy6f9K3f92mbirUJwey6hZI8Q4merjA+N8Ldagvcq25he?=
 =?us-ascii?Q?k5pWW5tdSCXtIVjoXtUnW8cUnN4nBPsO5tQnzCxHSxztJBid50y2WbL+6/cM?=
 =?us-ascii?Q?n8oNox+esMLO8lSC4moDDGDvLTvqEwAqGfAZUAERmhuX7WTXkrEPoQfUnjEb?=
 =?us-ascii?Q?IfCHJg74PGgGh1UvcpxlMcED5oTMAMDOfHh9dw9yf1LQL8S1VU9wDaHAemFx?=
 =?us-ascii?Q?S+lxLygtDPd2C3+oyIuhpa4TK+JKfFVirTZIgN2ubatOv6a9dKZkZibI/zvZ?=
 =?us-ascii?Q?n4puH9klp5ohz0iL/WnfgaLU605imSQEWxRUzIXA/FJA1zWaccdkkpLH029I?=
 =?us-ascii?Q?PL4UljENCa+yvLVu0psL+xYsYpStseeVQ6zyAagkCVlzdjK2ZH24blcJNL/o?=
 =?us-ascii?Q?i/f/e+CUcFWbIE9jXxuMsN+cmSFhYDSB597e2PbBTslSXaN2qgnFs+KMar2B?=
 =?us-ascii?Q?/X2lzjbPiog/u2CL3Ue0TMfYIS1zUkjfpEyGl9tA+HUb1MWzoEEUpWjKSJv1?=
 =?us-ascii?Q?qiIUt5Z4RdwHPGxrfzL3O2XObPlUKvSAJEwm+NGDjNIYrCX+UaIHvlmfmIsY?=
 =?us-ascii?Q?tpBXT9jlaeiFppivSLGkzCVpqCZqQjesBtVYPvMt4AoZe4W5sG8R0jrijypG?=
 =?us-ascii?Q?LYV8vQnHSD33gQluDPH8gnqanzL6M9zbcQ1tn9xfQDVH3OHSetWLDBIO5mJ/?=
 =?us-ascii?Q?5u6xTY+h1GQy2NS3sBBzWzNkQwJdK9ytA355VoLj2jHJUpCYRMDD24qWAkie?=
 =?us-ascii?Q?srbCwt6k8DEkJEMG1wjYbZ6SKOYuXQMgNbDr9ntRgOAp6j36L8XcpRa14krQ?=
 =?us-ascii?Q?x8vwl+hzHIQ9EKvIdYMitxHNkoRKmp2J1XtJSx5oXdZKPs2XlAXBO/QI9/CB?=
 =?us-ascii?Q?PJO0MjMb2r64uuiRwE4O5nUa/JKsD9cdWFWmvBR4YRSSZncBkWEMeSPzW1ZB?=
 =?us-ascii?Q?vlNx/i8l/7m3BfjPSxAZtnD8FJVgNpCja5ZAGL8Vxfb/RsnZwoYyIpbo5YEZ?=
 =?us-ascii?Q?DkPuhJwjUvVTH5nc/1SZrvrDfCotyPrHyO9F/4WZFt5x1nAhuWY6hhEfm5bX?=
 =?us-ascii?Q?8W2mT0QCqekmq83iaUcLtDHfucHndzddTOCYR8R/34FK7DM08XhO/PgEnAK/?=
 =?us-ascii?Q?l3DqpP3h0itxl6q2cuYdaCFpltOsIzPbUf7thrOppRt7NvssiFox8wsicDkB?=
 =?us-ascii?Q?W568Zlo3RveI9Kw3ZagNbzWkA0LawG5l9zRN8sDo2rR+On7UZvvVTX9f3sDR?=
 =?us-ascii?Q?VM4IWunUdJoa1XlGhenhQk6QMdSx+Lv/kBOlvROMFCg6f6pGYubx2g7wsO+T?=
 =?us-ascii?Q?BnEoXNdYArxYC0LzqYdcjeuchsYuljvEBvUQTXhstGZiHJtHVmQJj4xNe6HK?=
 =?us-ascii?Q?CPlPdWSge1lwd0qxBSrQQBg0nERTCFpn1ojWfnTmd4x154bYYeTU/hEK/cNe?=
 =?us-ascii?Q?HteZ5bzMyIM5IZHuCFB/YbnpD+U90u8AirdI4HRYU0gjD1eWzQY61FJsfZDe?=
 =?us-ascii?Q?YxUuP0XwT2P+lmtnGHXAIv3wk1IBB1LXXosUwpSj7o3hh8Sgp/QaaOxcsHvq?=
 =?us-ascii?Q?epxULpY2MW6zvv6aO/KldbI8P4BnYb2K3Pn6gLjN/CbI9zAlegoM2hjHD2KI?=
 =?us-ascii?Q?TlADqMe9wzIiRV7ySl9f9sAKDPU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000e5766-4c84-4b71-2c39-08d9c13d29ea
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 09:11:09.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsBv0wMYAgvuJv+rSR0S6dqbi0TtTn3PVtSHaGaQaY+6WSIb27fXhafuhtiJsDlBcPzeYNcIEkDuS8nO2jRwDwbOtAc+bIoqIBas1zRpwf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1565
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170052
X-Proofpoint-ORIG-GUID: AxahgGY0dLU50MRmt2OM9RrgBNjvK5DH
X-Proofpoint-GUID: AxahgGY0dLU50MRmt2OM9RrgBNjvK5DH
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

On Fri, Dec 17, 2021 at 08:55:50AM +0000, Steven Price wrote:
> However this one is harder to fix without setting an arbitrary cap on
> the number of BOs during a sumbit. I'm not sure how other drivers handle
> this - the ones I've looked at so far all have the same issue. There's
> obviously the list that Dan already sent, but e.g. msm has the same bug
> in msm_gem_submit.c:submit_create() with an amusing bug where the check
> for (sz > SIZE_MAX) will never hit, although the call is to kzalloc() so
> large allocations are going to fail anyway.

sz is u64 and SIZE_MAX is ULONG_MAX so the (sz > SIZE_MAX) condition
does work to prevent an integer overflow on 32bit systems.  But it's not
beautiful.

regards,
dan carpenter

