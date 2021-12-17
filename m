Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF53478536
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 07:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADCB10E6D8;
	Fri, 17 Dec 2021 06:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15E10E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 06:40:40 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2NwFt012915; 
 Fri, 17 Dec 2021 06:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=lieG6yPuqtVxWvre6iN1ZwUpCGQ0kU9x3oBNQrfeheA=;
 b=y8gluaE+ubkaZ1ldZpyMRnEbZTortOre5AZ2KuKMiiwcujbu1uteO4/mZZpo3ISyJu9O
 /SRdZaU6HtO6bhaaW4wOFeaavOTHJCos5h6Wdv7cugYhizdVKX2icw03HbTembLP+huL
 7ENwUbyj2Xav/pMRsfqsZRU01mHVHD7S4C9mHhKIw7GQzxLWakmLqdAgHZ4cFQyH1+VC
 s0wC0LZepfug+519jCKdWgVbttjSK5cvAQwxki/qsGbeCVos7MeKLkWrJn9HORpgwns+
 N4D2DOuXmJd1WTqkCJAzkzuz2E1Gh5Y1yCyEaC5rlwCetv3iNJSftzJbSrkck49tj/4r eg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrmtkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 06:40:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH6WIWB174564;
 Fri, 17 Dec 2021 06:40:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3030.oracle.com with ESMTP id 3cyjub2aec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 06:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvUIBIddM3T3tnpB3zfq0YZcCpcoK9KRBNxsMqTUQeMCp1LjxQQthJb6go/CCeB974yCzKmAbD4oyMaoQn4fTEyS4fdRv6jRJOd9NWj2U9dP9rCa5FYaY6DetQ38eB3cW+3g384sNY0iS4WBYrDOcr2303LZYYkxymQG3jwJ5hrQupM27CMcSeFyjPiyVGr46E31Nx0+6biD/iBr62eyhUUmudEW5IGH8PRMr+hZug+VuFFPIlunnQRxo8115NhcoE5fqBL+hcmxxk8EMRPo3AnDcaV2BLYkloCXkSmXVJV9mIAbdtC7xRUwv9L6f2nPV1HtaiG4ADYp6VUsY9xQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lieG6yPuqtVxWvre6iN1ZwUpCGQ0kU9x3oBNQrfeheA=;
 b=kPSnqeJNlD6UmRmUweBMlMLBY4aLHwrPn3NQU78tZewolEU4G0ubIrttWrPH31T31xzIxJj4enlR0ojoAMShDpwlqodcokQ0Q44yLao1NfpVetwDExG/iTj1XPCqyqFhr6IycPS+f/72+7yaLtKnrrUIxA1BWQm6kkW37bHMtbXJR/KBrUc+R6UL2yj4aGI1cK9vtTY3jMaSlKP9KnxuiJYwV1M8VDgvP2/e8xTUHKJ4/6jlLz8gPxmf58UZLFEsFjD2QoWkogdCZ8X5SY6RgZT4zksHteESbH6jVDMaQ6tHnf1JGtOrDtqFUct/w/GQXZ/CM1gVoKI6FLAIOEiJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lieG6yPuqtVxWvre6iN1ZwUpCGQ0kU9x3oBNQrfeheA=;
 b=CUH2byNhJlaArT6scCZJere3ad+WbBjOHbaYKPEmey7uBIScHgd9U6AY/z6XZySDLL/plXdfIdKSrVSM0pfrhaR6c2q7PItRtXVXvArKIKMUDMIrSt4Ten8e5eru0+IMmy5gBV8SMy1STp3bb4pPGYVSDUG/SYx2PPK3UtasS5A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 06:40:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 06:40:27 +0000
Date: Fri, 17 Dec 2021 09:40:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
Message-ID: <20211217064003.GF1978@kadam>
References: <20211216161603.983711-1-steven.price@arm.com>
 <Ybt8QWEAooP++R7a@maud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ybt8QWEAooP++R7a@maud>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0003.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e036093-b7fb-44b0-c337-08d9c1281ca7
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2365AD8C79C972C0144CF8408E789@MWHPR1001MB2365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNYzAYQcgNSiFMa/oifgT18N/0vHf583OvJa+3NrLR7d2hy2m+I6Zqf2LMAY4zrsC1NPAoedk0uJq3b53jOPma/jwdHfmi51Q63VMdr2hKwuk1vLI996w470Na3XfFbb3MyaREloyZkan9Ja4eUmUGZ9rqY/Rsnyh3JY8UxrOMTacs67kBJDWmghnRntAfD7RBvg8zQDo5VprYp93ME2ZsRQyLZaKZ4O2RMsjDU0h9bNCX99JaFfFD3+cWXPC0dHT6u+Q3VYcE47fLgE6eGvJL8q1n2ilfO+MZqFYabBiN9fS7Xkp5NJ9IT++bEHNQTIvhGUqeOeR3sFaxDSho2hvBlf3/rIkWXU2a1T9e3jOKCmqz23POIJuCRtK3TFzbQxPpPR1gX8VA7cGB5RLD+74LTzKm1QoTa7mTUlSOgsbY09zooKR45w0KAMJBdwrgRDMGkXvWYRfKlqmJFZ0mwTI4VY5NZ/kRZ+jcIuE5EpnTU/jjLXdlnuw5ajRUvHWXnoIxit4GD93CeAysBjPnx+gnip9wXmTgZEMidExyqMPpdcQcVUnN8qiBe8FPvgN891Yw7T51TuuIg/BY+q1MUMh0hsOMOWT/GY8a4fgaoZxhM7xhoDLrnXs5WpXRv/JiaBSFVC5Kqe1fviwkyMZPSXtgltfcIN/SrWGtpSSqEIpmcVEZmiu27C3EcpiMr2AZximaR4LCbpe+zYjNwNwCq3ZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6506007)(33716001)(44832011)(26005)(9686003)(6486002)(54906003)(316002)(86362001)(6512007)(508600001)(4744005)(52116002)(4326008)(6916009)(7416002)(38100700002)(38350700002)(8676002)(66476007)(66946007)(8936002)(66556008)(5660300002)(6666004)(33656002)(1076003)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o7AbvvgPj6105q51haBZB7ymQJBW3rdwl3pFFFt3twBVRC2ymdyyD32tcqmY?=
 =?us-ascii?Q?o3LxNkiJaYg6v/a+Z0i/IU11/hiJVljGEp+zg0lEngajxQY8pJoTQ3m7z7Wj?=
 =?us-ascii?Q?ZyzMyqv/eZI4U/ksxNzpc0mhbc0M5noNPqucY2/KNySe0nB1mF1pAhJ8zq/H?=
 =?us-ascii?Q?PbF+Jw8GqtWvkI6ZJRZvU94BFp5Tj2fXhvEq4YvSVyfWskZh07FwOJ1tjwh3?=
 =?us-ascii?Q?WfG/Me+zh0f3rgqOhQOSzpGvfkcFatZfhSnS76+KI0ZQVT8i/2khlQ53ezdm?=
 =?us-ascii?Q?Xfsg90vFs0uAIizwiRr7gFvjN/H9Ko9k9hjiJ8ZTmMNntC+LAT8ua8rUuqgj?=
 =?us-ascii?Q?4w3q0hzF049Au6eA0oOhqKk6rsucawQQDufE+cksgGQd7MPEQ1GbsokItRzu?=
 =?us-ascii?Q?RwSFH/s9kMR+urKu8n+nLDFHuw4V4kf0B7ppFoH8AirQPUy7+5Qpw/RG9fVE?=
 =?us-ascii?Q?3jwvMyVjAscvJkG5u+CuA2VPWCnyjS1qVMGkwswStzO2Sc6SLz3jdEaDZWt2?=
 =?us-ascii?Q?qYXyuH5H2BzkvhuCIrjfCLiekksz15eO9QcZGokthPrMkSHYXLET8pCPs2qp?=
 =?us-ascii?Q?4ngeC2fZl9Hm3EPQWVfRVhst9ITC7G8Tdd0hDOXaoedbMW6K4tr5LUHPpAvi?=
 =?us-ascii?Q?G/7AwMtTiT0sqTcL2RYvSHc1LMY9QmeGN/6MQli73P0KWSIgjOtgaWTB5oLi?=
 =?us-ascii?Q?hFAZPk5EX1+ZNoKPT+dExlnzxOVWrE+0Fq+BwL29TsjBuge/dxf/c4nrG9YJ?=
 =?us-ascii?Q?9Mj4VyaFh7Udfhgz8XU7Y74EMIK9cRJfFFn5f8z2GPREWI/g6rtWnnTloQN4?=
 =?us-ascii?Q?9iw4z9ZlP4BcQWu3pS+BUCMm0ckcggyZrR37N7+vBS9jwnXlWMQzpkJ7fmDa?=
 =?us-ascii?Q?lm5b4zQLD6L7A9BnlT+tikbAMZHIV+vrr5/ZUsd6++z7+mqm4jBdnMubBmPK?=
 =?us-ascii?Q?uQLy9mxb+FecML6C353lX5nI1whVI4X9yrRYR/of1+Z/lMagPgL5lagejQQS?=
 =?us-ascii?Q?Wtu1gr8iwOx5fu1Nu5qQD/YArOro/VBpgOspMJgr80rpgOJNa/fev4+4ff/t?=
 =?us-ascii?Q?WKgSFSFnIFh8AlKds31YN93iNu8KvJezudeyua7z5+CEDp/b8JaE/ru5R6xO?=
 =?us-ascii?Q?Q2MaZYMQIyrnre1Prlh3s8PvPsNBUBGqNURidpq7B6kpd8xK/3ch8T80SeGJ?=
 =?us-ascii?Q?xEhBIpyFCR5qUwC51J/M0Bw6Fo9s0cThNELEP79UBZQEpbrCmQ4Rx2rF7PQu?=
 =?us-ascii?Q?0nDiTYtTwo2so4LgjSsxUuFKRHTZTpO3O+JyY/7NqWXRaSDjSgcWJMyQOfK4?=
 =?us-ascii?Q?4LJEJ/yAAz0pHodUH7i+Qor7wUo9uGL9isJdcRQxrUxTaqeFviTcbPp59HS5?=
 =?us-ascii?Q?i7iMRngwLVLHw7H+qca9CFNK4oAjCtvV23cWKYa3l6MJUsKyr+kk2BzOOhVq?=
 =?us-ascii?Q?FFDqEr+gsheUX0fk3b0bVhl0XjRy6RkJ8GGIAGx7u8iSw+hr/DftYwO18qDp?=
 =?us-ascii?Q?Q20IDq+1qYoDeMXZpIfBCEZNrY9emtyYAO+fx/J//flUFp1bv6IZIPTkyEdh?=
 =?us-ascii?Q?6jw+8bWh8Cqs8tJ+UBHNF85AnCD0AorQ2sw6AthikxVQmOofd0agDZdVlL8q?=
 =?us-ascii?Q?Kxc8akMCcztLcg5niXhrALZ4gWUlVSxQVOeiJ+02o8G/aslkUHnXRibNcxt1?=
 =?us-ascii?Q?6+fvZnElKFYFoRPaXzWAWxMAcfc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e036093-b7fb-44b0-c337-08d9c1281ca7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 06:40:27.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEiF0j263PRj3ekUtFXrVTnSMw1fjrhrCnfXGki33ze3hmsLd84a+Txi0TGHoGv04iPzHnkjqOhyGkTE0v0SAnsV2KkrRtGCJlaPeO5gYU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2365
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170037
X-Proofpoint-ORIG-GUID: gjbsAWbxpcJIgm1ji7jdZVfkhyeJf8JQ
X-Proofpoint-GUID: gjbsAWbxpcJIgm1ji7jdZVfkhyeJf8JQ
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 12:49:53PM -0500, Alyssa Rosenzweig wrote:
> > This provides an easy method for user
> > space to trigger the OOM killer (by temporarily allocating large amounts
> > of kernel memory)
> 
> panfrost user space has a lot of easy ways to trigger to the OOM killer
> unfortunately .... if this is something we want to fix there are a lot
> more patches coming :(

My static checker is only looking at the new rule that kvmalloc() can't
allocate more than 2GB.  But eventually syzbot will figure out how to
trigger the other OOMs so fixing that is going to be a requirement at
some point.

regards,
dan carpenter
