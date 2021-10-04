Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BB94205F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 08:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6826C6E929;
	Mon,  4 Oct 2021 06:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939816E929;
 Mon,  4 Oct 2021 06:46:21 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945hr1v018657; 
 Mon, 4 Oct 2021 06:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=cDieWiz/9xzkWyH5PyHB8KzCBAi6R/+5WcCyYzGQKLg=;
 b=esRs3s6IG/+4jjBpcCvvKQu7gyDO+QeFomSOs14kBsahKIfo3NQ7fCS5VEVawsUIe7Xa
 +ZqRXM1AQemxFo7dbw1BkY+GiHPowk6G1pME8KMxC/T4OrDF1jvr07/5a/9PesB6jLdp
 ROiIbIy+aopBhMHsJUGfqpMkP2PfqcrhBNDkSNZXXWYMLosgff9X+fPatRhGaTcie9k8
 hi1qdPFN8PQA3KWtVy1ndWqkiQ2RFfQ7oMlLDwmfMHDv6DYiF1Rds0jIPqYN91PNpEWK
 HBICbxDBWejsKXjzIqM86t78ErOFK81jPQfyuDupzyFvVVx+5cotk1wy3vBF5G0JYn+9 4g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bf9m025s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 06:46:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1946dqL8110706;
 Mon, 4 Oct 2021 06:46:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3030.oracle.com with ESMTP id 3bev7r85vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 06:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8ro8iSA4rhfFolCPcG6Jhd9PVT/h8ef1TAGuw+KrJzhayZqXAk7sxTxNIERtm4nXNp4C0bgmnTdRLDQ51rSYxs1NHY1evWEb8wmzgHtSiOZknCrhRqIU7UpEZDMYTrXLDlXlDQ5/GHNz50T/1NsfbBX95A248NCLqaKf5psGDZtzyEdEQdZQZTgJD8C50A14BmOT0q6V3Pn4syqipV4jB+KFAL8auU16FEV8Aog1bg4Gib6ue5n7ISzpznx4ZHaUghImFAuc8kLS1+Wzd11r/Mnk2E1MxbJO1zzezHW6vatvQH9B9eDgeHIgWqqGW8JE5G8sMNGAxG8afBshKea4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDieWiz/9xzkWyH5PyHB8KzCBAi6R/+5WcCyYzGQKLg=;
 b=Qzk58QuBmnAiMRbB6/L7fe+UC0kKTPHTN03X59dDqwDjvwC329L99/3OL1CQO13RFDA2ewxOlkZGwKfhIOfif+idNgKoM0qQs8IGXiYeK2hYRLyn2T2KgNYpQHWbxznAwjSuD3UWbmdHYCai20s49WH5z4PDMaZm7x8O84sO7XjlbKRh95WEIhHnZp5WF8B/zTDDiX63gYvfqESml3+fK00ffFnPgEhDb+wXrN/+alslTyOZvi/qx+uLMLD2SWfVd5roW/VCq4c2zW83TfAkEq9sk2wz/OWqPxeLdI4ZoJ9wInBtWPUf9YxISXmCuA09u2GtjAfqlvQavV2ED75gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDieWiz/9xzkWyH5PyHB8KzCBAi6R/+5WcCyYzGQKLg=;
 b=setUn8g83+B3keCWLXOhXLPwMojAFDJBxIB4WrCD6n185i5GpSqzySYuKyvW3T97KR/Cg9zOYn8vkI9d7JG73xIYvdLCErmm6SRJKi6zI0Cj00nFkL0Fy/r16enStVVkBwz3JAFxcJGK5PheZ8xNbaDgIAn8LqQOB4cnjeAiWIU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5460.namprd10.prod.outlook.com
 (2603:10b6:5:35e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 06:46:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 06:46:08 +0000
Date: Mon, 4 Oct 2021 09:45:46 +0300
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
Message-ID: <20211004064546.GR2048@kadam>
References: <20211001123617.GH2283@kili>
 <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0047.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::35)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0047.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 06:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2992bf2b-48fa-4b74-d12a-08d98702a4e5
X-MS-TrafficTypeDiagnostic: CO6PR10MB5460:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB546065A9C16760C2E9D724F58EAE9@CO6PR10MB5460.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NIrYrnaTYUJcxbjzIPQbWO9Jrkom0fSn8caV6KHDvBFi3Iti4ocfQARNaE0E25ojsuHfyJieYoJFB2QX0o4i4zuKdGOOaqH2gKqdVra+9f0CzTxsWwkc23mYuypJDhXsL+cL8sWHbSPEkbrcxmbm0I5YW4A44ksghpx7x4lW7Oi/RNGB9ycBLhqQyQO3NYoqTaFr+sh0C1cBfLV/KjDD7yfAJ7leO6O/usjIApJDuMEv2vfHm2zHF5Xg5jRlg7p6UXQTPOaJYUIkcPlu3NVX+HGw0ECELCbOKUnWa4f80oEXfX/tUufw0mbN8cjbxp8MsdBAN838fj+aC4mPIDy5PfnNVjpySBcP4LNZG56t8j/xAvjbXzMywc7OHZAHvIREoqw56OFYBkRQD1UMofqFxGnfFZxm8Z/9rT62cM1J7G6iPaTK2pXpZkoIQLbWcyB+DRHii6HSrioOrEeW8Cy2Hhblbay+LwjrLUwo9UToGxHC70pcKgQtEwp2lmR5fZNtNZIZgoA1TyWVqAquYoDuPLss8+zYTSnIfmoBcPLSShKTDOKMJHNPN0SEU6TLxRDsjFm2RjolRB70Gpm3mPqQU/K+xYyjKmvfmTp4h9B8zSbaJ1j8L/Z8Goh8i9dS00FW15dzDRzpOI+lmfqWW0Vo1uH2jf7/TZsHW3OSQO33iwyvTjSfUPCwO+Vgb9jaZAaYYe+EAGhZW5a+pkxXoYJiyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33716001)(86362001)(4326008)(53546011)(54906003)(186003)(316002)(8676002)(26005)(7416002)(66946007)(66476007)(66556008)(9576002)(44832011)(956004)(55016002)(1076003)(6496006)(9686003)(52116002)(38350700002)(38100700002)(8936002)(508600001)(6916009)(33656002)(2906002)(5660300002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ar8h7lyCQIVRrc74H3DHDk2e7DdewV2e57ME1Gjmw+gu2KhMvKZQ82wwr+a/?=
 =?us-ascii?Q?8rCzwkkh5YeCLWF+qX/tSWoTKo1+IbhtP2/GYlxGgCC3m7l1uj306pFGQF+z?=
 =?us-ascii?Q?piehzBB4XSvTIAXKueaohhaRpwnOXXmx9+NpwEtWNiPmsBFWmuCkJb9joHxb?=
 =?us-ascii?Q?7ULeyeG6Iek69TOCpR1JSYaAYLb2puuoyH2ZrRf2VfLmccuBbkLTdi0ImVvM?=
 =?us-ascii?Q?XIO/B6op8/dmzUH5bJ3pnYNayvrD99jBwjulgU+sRrH/dTeejKyJYCn63D7/?=
 =?us-ascii?Q?QFyrHFS7S+x/yFmzVrOcTVSwWC579hqjTrsFCeWXGjyRNGv2R87dee6PIwti?=
 =?us-ascii?Q?QDpLqvhE0W6vVTjzQ8aUF8WOLUx/fdhZjUYkdGV2s40LusRdRsa6SQsgJA58?=
 =?us-ascii?Q?5it387FzfGrE/qsKgQgb9jPXTX9J2MDOhq//95ICmzPfN8wOGQfXnf5+SF6b?=
 =?us-ascii?Q?y8VqzFRx+NXMjCkIEhE8X9I21j9s9nZ9YkPrTPk7LNIUzOjZPJsie/j80rF7?=
 =?us-ascii?Q?Jv/evqAFjV3AImNTo2o9zcszowoXHzuwwlbUbR+CxyzVFI8yGGH4e38U8EiW?=
 =?us-ascii?Q?s1BcMBvkCv7tMQAhNZ6ZOJLoHwULtfxvN7dZ9fVxagRJXflnr9YR82vQORnD?=
 =?us-ascii?Q?rfPaEbD4yXIE8Z1rc8GKI0aYq0Ojbj3WOBbcx45S/dyswy6LIp35CznSaug0?=
 =?us-ascii?Q?HFSXZ2EIOqbCqDsNPlNDR8/tp2RUFtB+HRo3FHmsl86YDoBGTEdY5L1hoMUu?=
 =?us-ascii?Q?p4/qK3LCxSQfNNX4vMjevsTY/cteyNSTbodgvlLimObDRwcv0QmTsTqIO3QY?=
 =?us-ascii?Q?ijqVbRiyiQTNJPgwPYY9sDVYlLCX4z2BV+sJvE9DF9uC14/AsbNYLq6DXGa/?=
 =?us-ascii?Q?vA62i9maklcvIEPZuKQGoczudkTe3+s4wcUrsliGrDNRqg/VWDL0GZHbo8EF?=
 =?us-ascii?Q?8DVkULmNXggY/bP47sVoEjQD4frj+lIlwTH9sMeiRSYsTVoRuh8Ay3odPvr6?=
 =?us-ascii?Q?T7i9nsT+h7BT7PLHcuqDXWnhlaZB8/Z/ZO/K3bS+zaNNeuOc5MBETnij4EzR?=
 =?us-ascii?Q?H7aNDXLVEO50gD+lgKUZxbrkpKtzJLkHnQ5ptZH6BIkIKwKgL04BChD1xzmY?=
 =?us-ascii?Q?TInr+m8oGBmHSbs4Q9sylsy2O4I5SZEEwxBOMuP8uI+S+5jA+jXbcg6UC1ha?=
 =?us-ascii?Q?Ye2rg50yjG7jzzf7bfqQag0UWUmFgG20ConvhjQJUkSpVRUvQmnCM2ODvPgU?=
 =?us-ascii?Q?SM+a0XPwUqkNGCMagqIVknai5iHUJMXK9K1lYks0PXHNCEuCCmuLzRthH21U?=
 =?us-ascii?Q?dDdFJMUUZnOeOD+EQIkNrikM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2992bf2b-48fa-4b74-d12a-08d98702a4e5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 06:46:08.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5zPtfdmWrc2+GFc2VRX3bCb3j9VJxeHK4Kntge+XT3qbaNBNan2dVY6nadfc7nnGBYRpDoBV6Z4H+o7fbD7xnRFgpX4OI3TDEryfT304Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5460
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040047
X-Proofpoint-ORIG-GUID: fNk81l63gnxT2TkBhoCVJ-AqlhteeMFG
X-Proofpoint-GUID: fNk81l63gnxT2TkBhoCVJ-AqlhteeMFG
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

Ugh...  I misread what you were saying.  I was thinking I could just
check for negatives.  This sounds like struct_size() thing?

> 
> Could you please be more specific, which 'meaningless positive values' were
> you receiving?
> 

Returning any positive values at this point is a bug.  It's supposed to
return the number of bytes that were recieved.

And there is another bug as well:

drivers/gpu/drm/msm/dsi/dsi_host.c
  1370  static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
  1371                                  const struct mipi_dsi_msg *msg)
  1372  {
  1373          int len, ret;
  1374          int bllp_len = msm_host->mode->hdisplay *
  1375                          dsi_get_bpp(msm_host->format) / 8;
  1376  
  1377          len = dsi_cmd_dma_add(msm_host, msg);
  1378          if (!len) {

The dsi_cmd_dma_add() returns negative error codes so this check should
be "if (len <= 0) {".

  1379                  pr_err("%s: failed to add cmd type = 0x%x\n",
  1380                          __func__,  msg->type);
  1381                  return -EINVAL;
  1382          }
  1383  

I'm not sure about the size of "the DSI packet"  Could you handle this
one and give me a Reported-by tag?  That's probably simpler than another
back and forth on email.

regards,
dan carpenter

