Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB034205C5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 08:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5046E8F3;
	Mon,  4 Oct 2021 06:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505556E8F3;
 Mon,  4 Oct 2021 06:19:08 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945hrkd018657; 
 Mon, 4 Oct 2021 06:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=h1taugnI7Zvj/9vULTtZg3fKaoqvwfC+P9rCyViONdQ=;
 b=V1kSQTtZaEPsnL4dkan1KA9mOsVXr1koCR1dzlDLTLjPI5g5MdxYSbaDoTP/LUsu4edY
 qS9KC+P+oKG0a8Da2OhabyTv3DhgP1c90PiPN4RagLtXkiL42/BcK7c921BFeY7T0jnp
 WCboNtkxWl4fYkzdVo4ovQI2bfBrg7JJjkm6ItA7EFViGNmJAMBJuaKSfK4GLUIS1mwQ
 ybym+cK+ej6T0EuwbJSj3Y0qTo5Uz5YLil/cFuov7PcIfnwfcJskn4abqg2cNOIyex0z
 cbJjAlpL+QG74brwKL8feH09uHx73E39GgLg7idKLEws6b2eJCUjh6Apv3mJoeaCF+GI EQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bf9m0224e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Oct 2021 06:18:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19469q6F006642;
 Mon, 4 Oct 2021 06:18:58 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by aserp3030.oracle.com with ESMTP id 3bev7r7cus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 06:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2XdpEeAJTRnXPZb++k6ygm/lkjs1ZJspRcvUgNKQMkI1tnRSDoF/lFPoOg0NIQoJXqMNBtiEGON1k2ZI16Iw+WJWCb/Ggmoiq8K5J22mEZ5ZeArm2eAEWLqLUbHcxakFSLxNXGGqzQDZZHrOqV07zMzHI41PunMYbZQWV4/g5+bNwXg99Uv5r9yn35IQm6O9P4QNv9uiPHyqYHYOOiTabhgG62SITMBWMxtK7+aprg1p+L1CmtD7mtVFWZxjnn5pTFi/1AZkjNOt1ActEC8D7h2rm1H5iaxGSHg1hqPCoe8ds5//kMFlems+ES8N4BJ3uaUb+DGjT2X/fy1SKgksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1taugnI7Zvj/9vULTtZg3fKaoqvwfC+P9rCyViONdQ=;
 b=UMwB5xi6v8TdJefHGVc9x1690GUurTfhGMPpIf2BSJTHWzsjfZ/20QJmajub7oFsGyPZmL6IDl89m+VJzvYwUFWHpVqhmyTWu1XXemh8fQl2uOsoXZtiX9MUOSwMqcL1stjE5Af/f7W0iIotH99Aj1PYRd5ycF0/7Yo4AEfTrvj/GInDifWSZaAU8diUMeLkbb2TdLY2Inhe+VMAMZ017y4d25+BWtmqM1yziFq/OlWhHzz7cpJCuxVTW8Na9LBHb3MYHCPqJPb14q2MvzW8zPC7ByQUgAp5DKheQUL2qTl/Rl3hIFbhrgQE9F7AYfucooYPh2M3H3tiYDwXJXgsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1taugnI7Zvj/9vULTtZg3fKaoqvwfC+P9rCyViONdQ=;
 b=peLRGkJHofu4VFyX7uzDmG6WhE8bwYrGqMbOWJKukwQfgkauRkZ3bE7OVTKXphSM+ALN5YkjnwIHsW0oVyTSZXLo69uR5MojEh60d2R5XzMO1AQ7vUQXQOpTpaMi5BwVO3cPP78tVZxkLtdv12B8JoE9BGtOEK9wKuruzPGGyD8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1488.namprd10.prod.outlook.com
 (2603:10b6:300:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 06:18:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 06:18:56 +0000
Date: Mon, 4 Oct 2021 09:18:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Hai Li <hali@codeaurora.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/dsi: fix signedness bug in
 msm_dsi_host_cmd_rx()
Message-ID: <20211004061835.GQ2048@kadam>
References: <20211001123617.GH2283@kili>
 <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::9)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0004.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 06:18:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e13da91-e75b-472b-da50-08d986fed873
X-MS-TrafficTypeDiagnostic: MWHPR10MB1488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB148866BC3A47A77289306ADA8EAE9@MWHPR10MB1488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o99sXqLQqPSQxOPPr+6NSwdEtw3Knh97eZPpPmrq2EK7vDbLzesPKogkggPC1/CCAqxxu0nz0a/bshFmpi83S+WnVZWBHZ1OGHaimdZchzbMiI8YHdKIJJQmMyzYHR6ZSiy6zcQMW2MVN2TlzoEf/5azu2AhDr51kK2Eh21BQWvARn2US9w4S/5xJrk2TwSAMq+z47MnYYbUL8LiRRsDRhyhvgy/xieWXQy0Zyoj3oh8Zqv4b/eg4KKSaTr4EchBc4qjryMZvnaPveFis2QXQKFrD3Wy+WGzp1UBOLJFHqnt7SkGKzpohfaUtgP3nh9vn5KDbQ5NiqXbUSG7USTCFNlbRC4K7kOcbXr2pp/zos2rsUIjRfPPSXKZoMA2dSTU+UvGGC8xPgZVELOYiBbeA38Eq1VZm95l2TZCx7WdnC283J/NGHbRHmSdxIQDzLEr1w/ycjO10du7zveMPJIxXRw2ij98RqRYjd231BjZ7YQsqld/3R59/Nei59tSo/gIH2BmvUSXfnyTjIDAKno0/tcDqXYJHVdD6ljO2YGIhM9ePuL4QFCrsL1BUeffByVKA/zQaVtvfTC8c5VH53IpNTKwmqkknPO1i5UsKKnHOYgThzovFdvt1te6is213xlrHphjKloQeC5o28JlZoQWSGz0X4tDWhViTDVKJGsqWJf0f4dscgLbte38HAuFfbal
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(33716001)(6666004)(54906003)(55016002)(9576002)(4744005)(26005)(316002)(508600001)(86362001)(44832011)(9686003)(6496006)(38100700002)(38350700002)(52116002)(8936002)(66946007)(4326008)(7416002)(1076003)(66476007)(33656002)(66556008)(8676002)(956004)(2906002)(53546011)(6916009)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irE+PECB5zkLY12PYZV2SIO97g0ypxNi2JNUP8u1jJFChnNteA3PaGe+y0Iy?=
 =?us-ascii?Q?qyVF97ORDeuenOeyYD+SpB4gMGOj021DnYVphvyzOC209QQFbFCx1iR+TN2c?=
 =?us-ascii?Q?k1Y6UooeKUDCfJvrsImQSoWm1BOMQ534LZw6d9hYk09ld40NgOOfcIgf8BBK?=
 =?us-ascii?Q?ihlJwERrGIZ6KnlOslzWc/yMLkw12Q/NWnQGKl00I0B9Nk/dzGv5cDAGq2mZ?=
 =?us-ascii?Q?YRIVGWOGTDuNZrwqFsiJlBbqfPjBbflw7dZHnssd5J5MBKFXMWzQPGy//y66?=
 =?us-ascii?Q?+3SPNj/pnCw6ZP+maxheKD0lngEoJNN0k1Ue9wxCLONaa06VWxphlGAMEEh0?=
 =?us-ascii?Q?2KglaCy5bss1nL4ui+AxjgLZlkYjcRlmQbpOLjkO1Zoq1oBnC4xTCnqkGbZ2?=
 =?us-ascii?Q?/9R3w+RxQL+vaM82HvzuYieIVIenyEHhlLLN3P0zLSGrI4ZwY3w4FWHWAAWs?=
 =?us-ascii?Q?YxUj1N3AAlMNKNTWbvSv0CoNLec8q6Qi+dr12cjdTHqfbnjATICHboTPePl2?=
 =?us-ascii?Q?ohyfoO+i9Q1BKNPsY0jf4D8bXscIXVbtkkf/TgJUOz52Y2wo1XLtF04c2Y6y?=
 =?us-ascii?Q?bl5F8mborwT8LW/Xc/MBbZ5PvbSPnMKUvwI5PKpq73Fi05VP1myRFpOxwzf8?=
 =?us-ascii?Q?t26f7uXHpoMP5kEZEGYmbXWIafMTQkGORbngSDyoOzQWPe5LNvKlx7qGpd69?=
 =?us-ascii?Q?a3tvY+sRQyBVi8/w5ulT1F/4eoE5aWwEtXV0lqH3OfRyVKuaE15UFRoBgv9e?=
 =?us-ascii?Q?vlMJR2/pLg8CSjHJNxs0SkjEknT0uagYGC7f5BwC9TvjcIvbZmhsfXpg62u2?=
 =?us-ascii?Q?9QgO5p2uuhEydow55N/0YCARM72q9Cu5oJSkNbAbpQuqYl1EuhmhtmUyCi+F?=
 =?us-ascii?Q?AVUofm+1z5B/i0GZyJkEhTZUho58lYit0BSdlhyl6Kt+KgQXIyme+s2nuRWw?=
 =?us-ascii?Q?20SkKlz4YajbCYmsAkXFY5+HFLvSZXkf0Cvw1cWZDZHUkJTRfZ0IOyGhwDoz?=
 =?us-ascii?Q?QuQIdb1JTlEZtLog1Rz48/z8eJiPyYUHhmVs3T2TtV1I/94As3c6auiFpEI3?=
 =?us-ascii?Q?TARWAPuUeUY7OwHiGILr0B/8NHRaoLx29Q7hRe32XFPMxcFYmB8PWo/5s9hF?=
 =?us-ascii?Q?MI8Jx8qU1JLzzLbCJ9EM1bfis4Sner0IY+JCsxJQJfJ0T8/nzobHRr4HJclW?=
 =?us-ascii?Q?V2afFguCSiqabBi5j4KMw4FAvzhyKN0MsZZKQ7OUww/Mhih+3D27HfOqOLIA?=
 =?us-ascii?Q?uWSH6HQOZAiUrFD7b4NxaP+ZPSFRKis92RUHEWSmV9V/aKmWFiihwd9mUv5h?=
 =?us-ascii?Q?scKmNZpbZk3klnxX808nBmWW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e13da91-e75b-472b-da50-08d986fed873
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 06:18:56.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBICX4y/s4ZVoHI6tTO63O3skHJetm7thx0NRbvpC5mJUkDezom5o4vy4jBfXLr6oWSwMsXd6jcTuSx70HacQiJEHidsKL0a6t0x2yu7w3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1488
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040044
X-Proofpoint-ORIG-GUID: f2Z6cjmfiWppu4UPaaR4_8DPBAo3OZI9
X-Proofpoint-GUID: f2Z6cjmfiWppu4UPaaR4_8DPBAo3OZI9
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

On Sat, Oct 02, 2021 at 01:59:56AM +0300, Dmitry Baryshkov wrote:
> On 01/10/2021 15:36, Dan Carpenter wrote:
> > The "msg->tx_len" variable is type size_t so if dsi_cmds2buf_tx()
> > returns a negative error code that it type promoted to a high positive
> > value and treat as a success.  The second problem with this code is
> > that it can return meaningless positive values on error.
> 
> It looks to me that this piece of code is not fully correct at all.
> dsi_cmds2bus_tx would return the size of DSI packet, not the size of the DSI
> buffer.
> 
> Could you please be more specific, which 'meaningless positive values' were
> you receiving?
> 

Sorry, I misread the code.  I thought it returned negatives or the
number of bytes copied.  (This is from static analysis btw).  Anyway,
returning only negatives is a much better way.

I will fix this patch and resend.

regards,
dan carpenter

