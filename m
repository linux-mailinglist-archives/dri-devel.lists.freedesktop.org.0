Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF86444351
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 15:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0F56EA59;
	Wed,  3 Nov 2021 14:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6A6EA5E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 14:20:41 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3DxOdi016608; 
 Wed, 3 Nov 2021 14:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=bj3I3+0pMXLqsiFXfr0Je/A9GndisOXvP7YOPKJxaS0=;
 b=NvLVDyAGfEQ8KbaVTx3VC3+QhZaSmeTvyiL5O7CphgyzW6N2IPugxZsacOzk2Yed2HDH
 oH/myaYsqDkajAximkgnMfbs2Xdh/dm6TxABYjwrRvZ7qxnxh3OoG6i0XAwSRz65DZq+
 emtWl7TROAje1ykS0ggCORFwSoDph1y33N2ArM6FQ84cjmCYct2WujQoA0NjvUFjqIXm
 x972HrSjOL9OAGNoKoqx6uSTlEnlwdbDqcDTsIWSw5Og+wk5M9S65AXBmwB2+VRqidPR
 c70yqgtr/j6/lLwE+fEjzfcucmP2yiPf2VumhSgOHd+uBfpH2nQdsmLrp12oPpsKy59x 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c3mxh2944-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 14:20:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3EBvJp126913;
 Wed, 3 Nov 2021 14:20:28 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by aserp3020.oracle.com with ESMTP id 3c0wv6aj97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Nov 2021 14:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd4ZwmxtrgHolvpWZbOBSaaAnV4yAeDLnnST41p1gbW/V/hvv35Mb7vANsx2ZDA0iiQPO/+YX6kKJkT5C7+Xhi1f3r+zPuTP4SpvyJEoyn5jT6z/C/maAvjC6oxnCPerIMlfYCfcgNgwFlX6zApNcG0Zjcp3PB+02aahUvyFHz/Y48WPnJkncRkzNqjbuijULYapd2acwhK2j7hRXUqVSL2FItw9SMYP309Q/AYj6HtV6HORONdvVxlmGj3CzyrmZBSkgfNT5vSxpjiGAaMPSGs8+S5L6nrU3SwF7CYzqnfTpq0pIjsOSnEoXtciFj5IOSowxpB/JBQO949yVbF84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj3I3+0pMXLqsiFXfr0Je/A9GndisOXvP7YOPKJxaS0=;
 b=X4yk1CYMiFKHAuhCo8WG2N4zKBSXkklt/kNqeGYhFT9jUF59yzTUTlPTjgVAXuEn0/+I2tzGwWTojHKjea4n/1nnJKVwLNAgBgHsHENwTVLoMdD+qtxvvNNtSAG0wcZ7BCMa5edk3y7NpyjlM5xkx+D8TqrLFsBrMzHOCIwkESRc94Nt6b1Op4oX1+VRRvegXMa1A3X3A0P9ThV4fPxuSUGFtth2o7N0ITszsW9z4l9lWikpzcLCBBCrjPv1m6LcpKCVodJIcnUQTFZIc77AiEil2elYbk2nWrNVkV2Dgxh59RevFKHnqgbyl5c12oF5KP/WDMWpp8q/xUhJMCIA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj3I3+0pMXLqsiFXfr0Je/A9GndisOXvP7YOPKJxaS0=;
 b=khpJ3Um18/o+NKO/Dp1++hQf4IGYPIqNTCtCZFVEd8NQCEKWSmJwiNrCQSbNfS4UVGmvy1aPCBmlgO5NZSi7m2Q57g0lvpW/k0imfM1sZo+el12H+MSCivjTDm0mHEKs3nkC+BXIZ3LtSBRhl0J0iIRupILxFx2QA5JWaM+WGoY=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2087.namprd10.prod.outlook.com
 (2603:10b6:910:47::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 14:20:26 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:20:26 +0000
Date: Wed, 3 Nov 2021 17:20:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v11 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <20211103142003.GW2794@kadam>
References: <7dc405471da4771641d2942960d364a588bb4395.1628161369.git.xji@analogixsemi.com>
 <20211018030529.2055255-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018030529.2055255-1-xji@analogixsemi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0061.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::19)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0061.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18 via Frontend
 Transport; Wed, 3 Nov 2021 14:20:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d02e9c1c-2b0e-419d-00a9-08d99ed51411
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2087:
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2087505F6BCD876B8A1234258E8C9@CY4PR1001MB2087.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuhWDEVlZtif4Js60vrEx4o8yeLrPogGB5pOnoEj/Q5t0VyqiDv8aWZJgQH/BmFzqo051KP2P4i+9xl2ij49cMVFIkQeoi6Nh4uYrxQtfKl63eD7PjZgUh2GNWku4NkSuLlu0Hd/y68CMr4oZFifZfdmd6fZeRyRYgMHkNe5+EX4fa5udDJsSP2VlzKy8GRs4uEvVNXgS/LEc5ePyooojEDLSINF+KHTD0peRn/G/fgTxl+RXttkEJVHmuvU5r7AdMksgh8ceFUceMrd6mDymzH4bIvQnJhLccH4AJU9T2rJ9+W4F6TAULxRNaGfgdkhC5UoGssIQ6zQWp6xUu72Dh1NfP8Opdno68h9PArppLCiSvIm+FRgMPaKLKypkHPBpQZN42nHN9Cf45n2KF4SvpofLDtvjyzn2Fy1nEFSWFNXFtapKft19RozpwyN2Ih7zwx35McDz4nlRf9zXY23nTuZqwudyig9vR2sdopyUNcAhIpGO9YVcPXijsHYvb/+ln+pAZIT/1jQ1RBZzwNh1rTPmzp5oi5ZeKheIWHheSBvsobUmxTDxrXml6XKqdoIB/EAsQj9kbkSWiKXb1lfzK4iXVYIvPY2grJPPDxgvvSkYfa5pvWo9Ug/qmgjoKRFAT5wmmF0ozqsFw39oEujGdMoPPupG5pvRcGbONH5VLXEsWQ2HtI90sbR85EnzbfEfRuyZGmM46BWNZxBv6MZ4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(7416002)(26005)(9686003)(6666004)(38100700002)(8676002)(55016002)(8936002)(508600001)(558084003)(9576002)(38350700002)(4326008)(186003)(5660300002)(6496006)(2906002)(52116002)(6916009)(33716001)(66476007)(33656002)(44832011)(66556008)(1076003)(956004)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?44KAOToEJxdgOBSSIZrTyak4MJquYuJzcY/Y9ioJAOr5B+cvQrNXDJzKDWxp?=
 =?us-ascii?Q?UTyvE0zc16zk1ud110lX5pxZvinfvpnf0OQX8YyciiPOk6/BSDt/M9iNLSD0?=
 =?us-ascii?Q?dr0jebs8yegar74mbtS5pkETGE7E29QJEGkO/XRGA0TLrF0dnEXG+HfiSzTZ?=
 =?us-ascii?Q?ZvfZe2dOu9ZgAqMclJxJIvfPkO+w96oPQBloINib3O7FZoFskag1sdhkGfqU?=
 =?us-ascii?Q?Yzpvf8kDj2AdQj6PelmyoflOBajNUhg4AvsxRACJ0kgCmJ0USyUVCB/zjrjQ?=
 =?us-ascii?Q?BF6sNFdsEZyJDL6IQRMq13odOy5U/7oxNmV/dQhQCSnWpAZAgjQJEHqRNNxv?=
 =?us-ascii?Q?1tKp0X5qRJWb2Oo8uQqP5B3F29YhXaAXQU5jq9Lom6WKWucrW/UayjYjeCUd?=
 =?us-ascii?Q?A7NPuNLGij8hTs9HF5EGZD33XAYCEZtgjm/r2I4JZIjaO+YsYEcsNGoso1ch?=
 =?us-ascii?Q?l9pGe/0kWMkSqDd+36wglZmyqfkrdDwlBdObJUzOeuzjVA+O2o6Xlr+qYLxi?=
 =?us-ascii?Q?Mk6rAhUKKWjba47WtAl5dEaTpbeaIbG5p6YH6rs/vjzZJ3HaqAc//l9TpkQa?=
 =?us-ascii?Q?o5nmz1E0QCtwltHkYOxlWWdNlYfMFjVxNAWlxd6Y1HKrB03H+cT4OTWR/S1M?=
 =?us-ascii?Q?Y2Iqksnh9EoezXi96tzsiPid9v9QdtpOrNs597zO2ZBb1nFG3XMap5XdoL49?=
 =?us-ascii?Q?BMhiVG7sxGJy/aqNVrt7vSLvYpzGlREX6aPUslcKGv9LwRBZBFtfYUEOh3BU?=
 =?us-ascii?Q?20jTxPZsKiMPzxcJPiqKbXcf6+zgkT58wYMBxhUeSem80TbLk+SxoKQ7gCPM?=
 =?us-ascii?Q?yIpdukorDBZlhd8DojsNIpuHkwu9KPDrD7yIZJ8PdkdTuMe6gW0XiQIf17bP?=
 =?us-ascii?Q?sWxvO8lu+0uezvgE65lFb92zTXVnE8DZOcJoM8b2AXPMOwvDqGjPUgfegLtg?=
 =?us-ascii?Q?IAOWlSf4VjTYfafJZgpg7QIwp8Gu2nrKbHAjazkFLLenot4C/ciVYit6STkD?=
 =?us-ascii?Q?B8tuH31vCIXqcCAGkA+cLAeIBAYfhcAqDsFxus48kEUrVvYDDze43nrAVavX?=
 =?us-ascii?Q?Bf2g92G4g7JoP0/KsiT2or7QqYiVjhqLLWQs3teawi0gNBKIaBRVCXyYBDgg?=
 =?us-ascii?Q?pxuu+j9bJ1vxOv9miCdwJBpfxV5zbgHRHz6dKZnSWyGH/x7PXYiY23IJ0F5b?=
 =?us-ascii?Q?B2l7PKEg2v4zzl7uJ0JtWRBuKrrVn3NsWpQ8i9ewJ8tOe9DgC8+2g1u5egLZ?=
 =?us-ascii?Q?5pJI196ygNyHXI5bqwsSR/Qn5g/aU2azP+74cpL+S+NjRu2rsWjsZd6Fdpvj?=
 =?us-ascii?Q?zpWAT9Vca0w8+ByHQ39uxikl/O1bwABDOzt7c0nRY1bmIDj3r85XsOJf7SIG?=
 =?us-ascii?Q?81hDT9Haf8naigarJ9/Yzzdy6Wq3J5CdOFXmEA1f24x02Hxid/aNdpK1A7VB?=
 =?us-ascii?Q?2IwTpkP0a9Zx69Wu5at54JOyPqvqgC5Zl7bSPbVKiN4AuG69UC8q3vPwIHSk?=
 =?us-ascii?Q?iR0aSOHFv0PLCzyQO8XVOod9dZhMaKyCZiEH75VozGjLNth9F0GrAkLWtYgL?=
 =?us-ascii?Q?gvJpxDn+UdmJt9y99J6BGvIIPtUAUP5YA3PEAmcCH+EE3VCfv0x0iE6XtnY5?=
 =?us-ascii?Q?O8WSFpfeSRpNLXFXtyuJ2jsE6nxAYOt+PeJdarzU/bGLSHYlaBeULFSlQ6zn?=
 =?us-ascii?Q?bJxmVw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02e9c1c-2b0e-419d-00a9-08d99ed51411
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:20:26.1631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aB2ZE+20F7CaxbRtPM24uN1k50EmVGJurA3MskdtBi7vdFze1s83ZWl0WL59xD+j7Rt4CyR7128xtiuXTxLNS2rCljNoUmpDkjD0UgzrHVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2087
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=869 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030081
X-Proofpoint-ORIG-GUID: uMw8EbhN0fLphZKGI3Ec_gqhB8iwwhxG
X-Proofpoint-GUID: uMw8EbhN0fLphZKGI3Ec_gqhB8iwwhxG
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
Cc: devel@driverdev.osuosl.org, drinkcat@google.com, jonas@kwiboo.se,
 airlied@linux.ie, zhenli@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 anarsoul@gmail.com, a.hajda@samsung.com, boris.brezillon@collabora.com,
 duwe@lst.de, span@analogixsemi.com, hsinyi@chromium.org,
 m.szyprowski@samsung.com, sam@ravnborg.org, bliang@analogixsemi.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a super awkward way to resend a patch series.  Next time, just
start a new thread and put [PATCH RESEND] in the subject.

I am sorry that no one responded to your thread.  :/

regards,
dan carpenter
