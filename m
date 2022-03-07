Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD474D0464
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FA010E088;
	Mon,  7 Mar 2022 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A7E10E088
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:44:38 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Ekc59028616; 
 Mon, 7 Mar 2022 16:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=BnSgpjXQkOg/50zDWsmxpkOJF/KT2iH+n+UrzbpwzUE=;
 b=NGGWclbGM66HeJpg5Qj8FvL3124p41peC2iNDf9NcykD8hmHx2g5ax6LEDpgxhUyIioI
 PP2Cx170CCS59Ia9m4XJ05MwfPomkPwtQO3KgY4cBTIDMZfsrwuQEC1j14Pe4GY5Zv9P
 z3a8VyOBMmTZW2FgCDrPufkCyqjVvnO01eIZcvOdKicgA0TWias18OiB+BPLG+7uHHJ9
 lf8APuXjIXsBpo02kZH6ymBgbDaT3ZUFwRbdkYehoAjxYrLJyQx78U5sbB1IKVJm99VB
 ej23VYJSPKq0ghIyW1CMaPkvCEmMd/MGO4734x0mgS9dDvbjooiWfBaJzpRMJdZLO7DC KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsccy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 16:44:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227GZ820159520;
 Mon, 7 Mar 2022 16:44:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 3ekyp1a6qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 16:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fagjbY6gLVBs8fsfhm5n1k7km+D/Fx0uCYe1JM2FSXAXBGglUeubB+9A/87LgO45yAqY98ktJ0Rse5tAq+yPYBe1Bqs+RYGg42HgjqSXG7vT2Uzk7evzBBm8XlHNwEW38v4XRpRXjRG+zGa7TlieMMacJAHOyDfvgVlHKdCSj5OTAAGxL7djz9ZU7POXCL+VMpgPA9DeyvTv5B38CynIHOGkdM+kbZ7YRv/+Ji4r1SlNEtwjEpaqb3fyj1ioqp8dmGPtSZqZqOLM7eGIa58sczPLj+fF4Nv0zUi4k6a0/AqodJxniHrVKFVijJe29p+bY1Pci2HMbqshtWuP+z/8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87uYw3Jha8GFLyjmkn5w52oc5nRbxx44Pd7EymKPnv0=;
 b=CCmMUOy7IzN5S7FP+UW+QobWxnDmU2nSLODsLWP30VGx0oNBk3VegIdX2VXslmeVOg4p6nixbTJtU37XGQewxOK5qa3SS8S8b9iDlUGJ6g6M9kTipUqUP8gL0gbVXmXVsJ22rdnYnYp+KGgoOm1CGmyxh2MVj1TomEQH/eW+e3RDQIXbRaZmKELt2VhKD3jrEVaxtH3QwmANfKQDEZASjMLFtop5S7mI8EH3nPEJi+l4pMjSVLl2kBY+j6bZFD1gQvF2333odLP6N1CG6Fd6pK4rqltNp1BCVBE0NJwLzmZHDzq0VaG6qjYeZzNLYj23OcNsV79W2JeilYvyyPaDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87uYw3Jha8GFLyjmkn5w52oc5nRbxx44Pd7EymKPnv0=;
 b=TO0SYsqg9g/y0Du5DvwzQXneedcPYcp3EUtb8F9rIp3tNrxC3gsqOL4k+4qqir7mko01S2O0zAY8kGWtk3/72BsYZdxTw94yqF4a5/GuBYbTgLgnkai8T3kIqVW5wFZeJcxy8qrHNQKl5OBKSN0BB0PR8Y/zrt3vUKigWDbs+ew=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4190.namprd10.prod.outlook.com
 (2603:10b6:208:19a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:44:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:44:28 +0000
Date: Mon, 7 Mar 2022 19:44:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/selftests: missing error code in
 igt_buddy_alloc_smoke()
Message-ID: <20220307164401.GE3315@kadam>
References: <20220307125458.GA16710@kili>
 <883bee2e-bca0-e0d1-613d-d744574ffde8@amd.com>
 <091af126-751a-82fb-9a5c-9a7c4d614c4a@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <091af126-751a-82fb-9a5c-9a7c4d614c4a@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0063.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bfd028e-bc79-4fef-5957-08da0059bf09
X-MS-TrafficTypeDiagnostic: MN2PR10MB4190:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4190193F73D840E956D39D5A8E089@MN2PR10MB4190.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsEhUczTPyLc8uM7xlHhOMA90/YsnKHxufjXewFCFieib7WM0Wwr6+psFd4bAk0h+o9hnGKCtZBo+wxmkCwCJMcBBYc2BBlPn9z0v9h34DU2QtKUOnObGyJjAXVH64hd2HRyP3ElulAQnz25IJRBHeNi28G1OLrkvg3KYGno+fet1mFZFbGZtDniPzEI3plFh3YOOJ3rzqD1P4A0DkNAjrXRTBkbRn4Fncy3/6zJ4n7i0x7q9wRTEM7UVpWcpEFbW7N+3PYjGtPlSr+aKeAXBMKfcBzjjothVeqkndNFdcG6RkNWkZ96LOBARq3wFAWjAe8vmiKDO2W7pZ291Z44Tet9QkgqlxzhSVpT8V1/sLyrUOREscRzJwQQdT/sIzi8f7D1Wuo1My9kOptR4+nn2YjnYGXihkpzQGL3yq87mrwm5PKQl+XZD4ng4FnWK7z829qAgX/KUthGk5WkIyuqNA7uSFnqAZXOtN9xhAOxe+pzrZvLcFo3hUiKGXCmTRCjr/zFfj4hisyxK0MTPByCpaDT5RyuL9ZwQL2MyxyTXKy6T5rjzJxv0UV/PzceA2FIiwJ9YbLiDlDeV8jN5d66z4QMHwfXBBO6yyYXIbzOFX6nE2c89MgIcFq0cA+Oi5kEBF3NdRcuJlus6INhXtOum9GtNmY4vBWuTtMIVIALs8r2CopxtwFhocDylHhTUa4N1D1NSukNnL+L3ydJgL+n1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(38350700002)(33716001)(6916009)(54906003)(83380400001)(316002)(5660300002)(66556008)(6666004)(4744005)(86362001)(508600001)(6506007)(44832011)(33656002)(8936002)(52116002)(66946007)(6512007)(186003)(26005)(1076003)(2906002)(66476007)(4326008)(8676002)(9686003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RAjeXVqWxrpmcfN3ivaWKpuDG/L1g3QCw98ayEaFuZHgynG9c/A93m8SFY?=
 =?iso-8859-1?Q?aV/usSRzcH6arbQHsccCrcRMl+fDm0Faj7CEZW3L+oqtnz99m0Jd/wfNGD?=
 =?iso-8859-1?Q?aC9IVzpgdwVNYAQa6jlOrreXHQmIdr0GbpmSN77X8bvBy8Rel0RsA1WVgg?=
 =?iso-8859-1?Q?SsTrzum1oIvtbXQZI6SEDBNCrIKTymivOD0b/zHxRPWTtvbLn3aXGQPOgc?=
 =?iso-8859-1?Q?gW8+ws2oSOhFUu06jy3Hs3Oaf42gWtWWJ8H68lz810Y5oKk8/xrzMcOd+j?=
 =?iso-8859-1?Q?NR/GGGCSaIu82E7z8kZ4TXGAu9zgwq6hHRIGitZ0ZYSmBNB63JrcBy/lxy?=
 =?iso-8859-1?Q?Fa10IAOvuIY3EbgC14+x9LiUqkTcPewCDaolbxIPgM10kMEXY3x9mes2TX?=
 =?iso-8859-1?Q?k7Hs0am67YomtAfXV2nARql9WebuluUguZnE5ttz1vz5MFDol5GmiSiFuQ?=
 =?iso-8859-1?Q?EBXVms6oB7irClzWX8jkm9Lr4hwnCcFi+4GgYbWr5yG9ARsQ/tu/zMFjvJ?=
 =?iso-8859-1?Q?ZNLTltXDewoBCYGFymB9Ig8SOd3CrCNNoUbwbZgTmtGaGC29JOAQQ2h/ys?=
 =?iso-8859-1?Q?sB57x/yaeC0wYzHEGHITe6dsQc1id6eG8AapZmyWGjmChvMFJMqFOH9U1d?=
 =?iso-8859-1?Q?RNMoqE4EhzieBDmpnZ5k4W9QHlAHOO1H9w/wCM18BQJMvFf0t4TK3qlg7Y?=
 =?iso-8859-1?Q?Mfz63UKmYjpM4szudIj5evqkpTjrI67zzNkvbFx4MCPreDdWKe+LnA4u97?=
 =?iso-8859-1?Q?hXYx9qrmWjM6KEkxmNGa4a/kYYNN5oQRNd7M64pCWMZQF1xHEjJ7dG2B6b?=
 =?iso-8859-1?Q?uIOWIriMW3UdmH+rKT6ikCxVgXI10w1zrjAg+KzkWI/qoyq9tyPGe592pb?=
 =?iso-8859-1?Q?pTMtcuDccyD+thtoxO7d+SE+y44PPlnLr+fTQIOgJYOqGelV//jgVAVRlL?=
 =?iso-8859-1?Q?9HImuRjHR0KR5AxkANvJQwu5uwDLYLGwRZiSYIRteB3GlvQbujrJtzUrXl?=
 =?iso-8859-1?Q?0OFPHebFzqgj5SyyF8wWQXoED34FFbHOVEu00F7bW9t8f93wiDVgUTDBQz?=
 =?iso-8859-1?Q?KEGuxGzdfwotcJi8HSevwhGwTBGSAuip2CCvA3eFiA6p20pKEXyDF90oRa?=
 =?iso-8859-1?Q?SxJfp7VuCCGRcUtJB0VoQlMwq3E+VuZxIrGwwMCl8EZM40vxXVcUxKULsx?=
 =?iso-8859-1?Q?zkv9SJyNtcBidK8kXp5AKwrb5J0le1u3gz8dZ0bZDAq6BhwJdQB1OrTW+N?=
 =?iso-8859-1?Q?zTn15/wHKHLKrrh16u7nVNL7i++RmegUgFHilm1PQQxikqwlSDouz4SWas?=
 =?iso-8859-1?Q?wZxcoUyTNFo8WtQ+KaSNKbh36u2tRkSijB+4veFE5AgPO1UdbjJVC8e6oZ?=
 =?iso-8859-1?Q?p/eYETmS5uiWsjv3UjsoDC8Uy97OYcH+G2I7hXZ+99DdbIceYSY28IWegS?=
 =?iso-8859-1?Q?paG27TxzhOHli/5Cc0TyIiq6GxXGmbks5IRxSLms2Pi8mIVTdW7X6AgmiU?=
 =?iso-8859-1?Q?c2rPTDv+O/LitXO1q8VM6NqNxA7g1+jEqTBG2fHuhzEnU8jArfIaFk7/yU?=
 =?iso-8859-1?Q?lvXkt5KQd+KAIrQs1z35iOCkAxaN6/kquJueST/Fw1Of0Qq2ZJPupPX/LO?=
 =?iso-8859-1?Q?8ZNuc+X2dBAQTPuOaaT283ojuLcl2xqSg47KUcGbGKX+G8iChYVGTuNubI?=
 =?iso-8859-1?Q?vQeoTv/GUkIU69oLLjmBydG1v2FUmLWusnvy8NLJ9fndJ+BwH078+LG746?=
 =?iso-8859-1?Q?Jl5A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfd028e-bc79-4fef-5957-08da0059bf09
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:44:28.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pHULVvhCefoFhH2u0J/R2JU5jT7b4HJ734nLvNYN8K6zsW77tKfnRJOK+Pe+Hn3TrdxhCsMdre8NqiOYiJujUtFIQwoczYfAEL4mxpNNFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4190
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10279
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070096
X-Proofpoint-GUID: sZThR9xYlr1O6X7OClQJmA2C7AuTxo-C
X-Proofpoint-ORIG-GUID: sZThR9xYlr1O6X7OClQJmA2C7AuTxo-C
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
Cc: Arunpravin <arunpravin.paneerselvam@amd.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 05:14:59PM +0100, Christian König wrote:
> Pushed to drm-misc-next. Just one nit below.
> 
> Am 07.03.22 um 15:54 schrieb Arunpravin:
> > Reviewed-by:Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> Some people are picky about using the full name here.
> 

Signed-off-by is like signing a legal document to say that you have not
stolen anyone else's copyrighted works (SCO lawsuit).  So it should be
whatever name you use to sign legal documents.

regards,
dan carpenter

