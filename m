Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5233CE66
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 08:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0689C6A;
	Tue, 16 Mar 2021 07:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570789D52
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 02:17:53 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G2EYZ4008277;
 Tue, 16 Mar 2021 02:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MqEjlnAUmNZAlAxJrr0LIG8DhxpS8QYitK8ujUIirS0=;
 b=CAmfo1n0d0SRkZNaXSsNHL5RHhUVqXN729Pgjrn5xk9UOtFFTsolYGx+qlpqRFnDTTd5
 P+7aJQczrYP6lyW3PBgqCaYSFrN9NrAOi4XU8jBlSeFcLLRaNqWvtmCYvnkRh9AMTpb6
 cKqXEQEJPUQpNbZ0XsbCivD87C1OIc8Swtn58wiZBIR/lJhs4liALJrPYmWj4vEjM29s
 VEJx2ZuRRl0aoCxF5lDpA7MvUOD7AEfa8w/2rnihm9cnetKa/lhix1HsTwA7+eWKrrzi
 QYpXdUzUQTwIw8vWx0afRz3JBK7EJPudRMBe2rQUItT2OEzwZqnpQBGbJRBRdWYUcDX8 Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37a4ekk0xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 02:15:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G2FC1U190445;
 Tue, 16 Mar 2021 02:15:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 37a4esadsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 02:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7nmYPMThy4JLFVuBmkLacC71YaBAAtCRZr5qlZ/659ej8KUgBO8Bwl72wja2RBKc7rkECIQXnq+oWaOd8GGXYOraJdRVmbripNirWJ9aX/WQdIDnNPR/C88z6Z8Qrn8zlFCwYBJ/J9/Wq0cyckIEnbIEIGSSiRdlLPkccIG4qFd3Il72iY9vLcQV25ndLdaQIHwqe07G7YMV1Gy8ZLL6ftk8+KQLbGvON4xXItTSyFZ+AG3mf3LgbcJJPA2YnUOytHCm2dSqorfRKjG2rcNQNmp9ccpee8tZMz/nHfNoxfU/ciBAvE8G/Es+dcANN3B7fitCUC1SB35Z4IKIZrzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqEjlnAUmNZAlAxJrr0LIG8DhxpS8QYitK8ujUIirS0=;
 b=ZlvSGOj6rHxAqBDnyWGK09i9sSAgKd1p4cFaNlGEPwaYyd71RjkhSuPt1qd4AX8CUaZAfXPqzRiuW3+HEAxxXgheRqslfBPx0rari9CMioxZscQRLFXjzBix+Q4SJQs/ZckP/fY46nsTN4uAXUyAELL2lGsFJO607ArH6Ugzf+UFQk/if2gYnNobDxiBZyevTZ9v+Sm9GFg1jdt5rX5/346WfUNOjOy/wr/4O76gAdDqVJbAlgKtCGsyR1XfXIvozf8arD6WqHwMSdsNp4018dBjv3eOkfs/49Pch3+eTIV1O4Lh5Di9dr2JKYwOy17JFomTfeLnUtHEYqS6VQzMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqEjlnAUmNZAlAxJrr0LIG8DhxpS8QYitK8ujUIirS0=;
 b=aF1wpTyWVyE8YLL0kpl2lMr9Zk/8eZABK3idZjXL5cclc8l8ZNMRq5M46BTEx1QkWRXAmSkZGqP1bw2imqrSqjxL34NGzLDgCy8sjbeRSlEoeU/2OXW9uUGNk5EGEmqptdRkC7ifPPqPjxSm7oNgspMJPAiB5pLgr68NWpm1D2s=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 02:15:25 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 02:15:24 +0000
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/30] [Set 1] Rid W=1 warnings in SCSI
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1blbj6ebe.fsf@ca-mkp.ca.oracle.com>
References: <20210303144631.3175331-1-lee.jones@linaro.org>
Date: Mon, 15 Mar 2021 22:15:20 -0400
In-Reply-To: <20210303144631.3175331-1-lee.jones@linaro.org> (Lee Jones's
 message of "Wed, 3 Mar 2021 14:46:01 +0000")
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: CY4PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:903:152::20) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 CY4PR13CA0082.namprd13.prod.outlook.com (2603:10b6:903:152::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend
 Transport; Tue, 16 Mar 2021 02:15:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41962edd-d646-4272-4f34-08d8e8215bd6
X-MS-TrafficTypeDiagnostic: PH0PR10MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB44073C9730A98252D5576D478E6B9@PH0PR10MB4407.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbkNKynID37KjcZCiw/UplSSkRyen9OSrUvCogPrVIj05/hVVP8xzHsV76hh1r0fARh36k4TWB+gy3Y+gTXYzj2nVoftyxKWNB2GqfyBZRzGGoxlXMuy1aFzGQyfjJurSOVXkzlLmxGkcTgvY1Lap+cP6Hm3XMCThRW2qZEQzIexMo8IPr5VB0Ke/f/Rt2Uvm3VsxflwOVR84ng0f49Zsgno8zs98C9msHDME79zwhynZwVs2WcVES9Mo7bb5CKBkVAQzLQDbrej4SY8Fx7xvqVITKgoWz1oa0heTwbgYhA8nEIJdZntZzovdGLIjiNjGoGvKiKBQ4rz7R7d3pT3ofF0yPfJTw5nm2QKfzP0uO0iOM1vt5FKoysBswedIXDvaTOs34wmn2Txb0E82+KDaTZyd5AsjJkh5W98zlxTCWHzHlqnZr4u2BaeUb8p+ueejl0qI9q5CSYnMelsRnDmafbYwFU0k0G6lz83T9o1F+ZEwY+lXTskVN9095INum/8yMeF5fpFwXOhe9Jzv+Y4fv7A9Haw0tNgmxEhUuWVgtIgunoleqFCcVCVChIslAI6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(396003)(39860400002)(346002)(8936002)(8676002)(7406005)(7416002)(558084003)(66556008)(478600001)(2906002)(316002)(186003)(86362001)(6666004)(54906003)(52116002)(7696005)(36916002)(83380400001)(55016002)(16526019)(5660300002)(4326008)(66476007)(6916009)(66946007)(956004)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vn2kViU1Xn4jY1NyM5QConSNSHKJ3Ev1txIGPifkHs2t8IWHBO3Cx8ZAf3H2?=
 =?us-ascii?Q?S73b4/4ND7dKN6EB4JsOBskIQKuHcQGvO3mnS7U1dGeq6iiXyA9fAqz1zrMW?=
 =?us-ascii?Q?3C+fiLy/6Z1EKicuH+khyOB2lUjdYA7rS0Ff5TmvEqcZO9bQhj7RMBY+qN07?=
 =?us-ascii?Q?tKWyILoUrpE6ZuguhUa+NN9OTAtLmvCO5tzdJ9+KPfB0UqA4giGzktbad7Bt?=
 =?us-ascii?Q?ZhBSVugyjI8dluVxq0PglT2J+IUKYcQsMvc20h5x4j9ZktLgJvsYtm0s5UzQ?=
 =?us-ascii?Q?VbMdySWIaK+Dlauih173UusFpBCIqPKNrEw6BVuRsfrSPyAqWUmYxyBEcWOc?=
 =?us-ascii?Q?+VLSacdTqAQ89ctoU+ROQhxSElTSK8L2LNdZjzxorrhh5lr+dGuvZu/Fbsia?=
 =?us-ascii?Q?whLFLgbGNypuMg5hiQJLXzV8CCP2htZY5PS1mTNlS20IfW8+gkKwTt6S/SM4?=
 =?us-ascii?Q?bRT9cu5SJLM3Vi+hc2Fzah8MYgVVzkgxHFiG0ju1qPn9Kt5oWdjIDxHkNrKr?=
 =?us-ascii?Q?RmkojVsflfFCRyQAhsDjP3fvgNKAdv/wECEzB4SJCAfPuYivtFazAFtZudVA?=
 =?us-ascii?Q?OvGMSr3Y1jTUXVRgfYmR21skdsAHeuKcuW1zo7XoVORhvQ5twGHotQrMEKe0?=
 =?us-ascii?Q?OYEVxqgEbVb+9lo4M1yL09NHVArPMh0Re70bN41kOEuZX4oseNzJ4qhoEFu4?=
 =?us-ascii?Q?nW8DbfInMVdk6oEbvXvruOp0OdC9qfFEtCtAKrUItDoeKRBPmXH54Be2dk9f?=
 =?us-ascii?Q?p3xkOWBEYsiWnsetj7Y+0pFcn91w1jCIB//hz+KcW0OkgRFuJIUjGiApDngl?=
 =?us-ascii?Q?10a/rcr4C6K3XTaSaqgVvZkO5c9Oq4rRgcF4OfcCOKxq5iAR9FZ91Tlhqxcr?=
 =?us-ascii?Q?YIqP7aXPhlC932Gsec5oi4Lqg5RmNxDybUbBv1dTjE2CsuKpV8Ing0gfG/9H?=
 =?us-ascii?Q?lu+0deozvGdcQjAete4TJcyJ50WEigP+bCM2A19/nLhZ7tK42WkCwauJrkll?=
 =?us-ascii?Q?BaLW5BlDV6z9xEzBj9wl2ArqCI6q7aA6bpR+3YfC01djL5gO3GqE4AGdp4W/?=
 =?us-ascii?Q?jMNn+17ziC49KegRlf9JvuUH3O4tWhztN486RGiCy5qy4Oz3Ni2cAG+X0hmq?=
 =?us-ascii?Q?8wLFK1ipvjf58d/K/vafL0f7y9lprwKTUIqWV7BEabInuq1yV255CkLrDGN6?=
 =?us-ascii?Q?M08uCJBsAsvyNObUDjcSaT3uhR2LOWhB779p1JwUMz28PpLbEXbYPEFAcGWh?=
 =?us-ascii?Q?Ousg3x2LcdWy2Vo7GO/D3xNF+6jYt1h175lD+J2lxvPMYY+lhTRk8WPDbfnl?=
 =?us-ascii?Q?JZ6WN4JADQdzxT1S0/IegHie?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41962edd-d646-4272-4f34-08d8e8215bd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 02:15:24.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkU2j9xOf7W7VvjH6EVm6mZ8zGUlTaqC4uy2f2DfDAj2kO+aMyJMaB1Iz/GVWDPEJSpyyE+uyFBdBv9u0aAyGfLkoUuDYpRbficeoUYIz7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160014
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160014
X-Mailman-Approved-At: Tue, 16 Mar 2021 07:14:34 +0000
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
Cc: Atul Mukker <Atul.Mukker@lsi.com>, Javed Hasan <jhasan@marvell.com>,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-scsi@vger.kernel.org,
 Sangeetha Gnanasekaran <Sangeetha.Gnanasekaran@pmcs.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, "PMC-Sierra,
 Inc" <aacraid@pmc-sierra.com>, MPT-FusionLinux.pdl@avagotech.com,
 Jack Wang <jinpu.wang@cloud.ionos.com>, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, Dick Kennedy <dick.kennedy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 Luben Tuikov <luben_tuikov@adaptec.com>,
 Prakash Gollapudi <bprakash@broadcom.com>, linaro-mm-sig@lists.linaro.org,
 Hannes Reinecke <hare@suse.de>,
 Nikith Ganigarakoppal <Nikith.Ganigarakoppal@pmcs.com>,
 David Chaw <david_chaw@adaptec.com>,
 Kumar Santhanam <AnandKumar.Santhanam@pmcs.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Sreenivas Bagalkote <Sreenivas.Bagalkote@lsi.com>,
 megaraidlinux.pdl@broadcom.com, megaraidlinux@lsi.com,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Saurav Kashyap <skashyap@marvell.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jason Yan <yanaijie@huawei.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 linux-kernel@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Manoj Jose <Manoj.Jose@lsi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Lee,

> This set is part of a larger effort attempting to clean-up W=1 kernel
> builds, which are currently overwhelmingly riddled with niggly little
> warnings.

Applied everything but patch 29 to 5.13/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
