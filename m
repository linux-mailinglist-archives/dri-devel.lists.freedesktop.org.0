Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F846977F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E956EA1F;
	Mon,  6 Dec 2021 13:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69796EA1F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 13:49:30 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6CCqCX012705; 
 Mon, 6 Dec 2021 13:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Y293yVayNo0HaB/Xu3Rp8QzWFKofvbzUd755k18cLy4=;
 b=W5nHdvLIRQKrQ2KKOZ4+QYkcHrTKliQt1Er0Sxgh+zcO1M4QxYLvMgF/SxzDduqMCI3d
 LQr5jGYMgQVbVTA+Lx38L8BBm4rnSOpjyis+D/2zyWkZlEYwb/8DVGCbMajScv7oQYO7
 qsE88YN7eIT9xCAN7v8+BvlDzysmw5DtRlhI2F38QFFeSfwz4cogEv/Wy8KQpXfV5gPh
 10r8fOI1a7orO/rvwiNi3doLZi6Xow2TSwsfxplgIaxc9Lg1tTkjDdB9m4bRLDfiLwvN
 UpborMPcOaADzwHSvUGFCS5HmbdEl3jiPELk364tVC2D8oyPAQJbWej6OU+QzFUxLhqB xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csdfj9tr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 13:49:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Dg3rR109018;
 Mon, 6 Dec 2021 13:49:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3cr053efy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 13:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR+752mt1Kojht/X/IYzTKBOHQV4qfu58AiDqgEF7jRlL91qdSO00+3gWKKSzhAdNlmAq/spgwA+CrS/t7dPW/LxccDC3r3+Ptfxohz3a2e8iDaN2JAVH0LjmVdFJ7t0fYEGYLuhk29Dpy474RxoCkhaZr6G6triDzkPIkvav/BoN3SI+IFnAAtrtSSpn/X6mKNy7ZiCXX8Jcdl0fA6qpQEe6kSt/laroUx0L/vEgfUO0RgawS+awQ0axdsgzvM/xhbtKx3S997MG247MRBMTO50UcXUWwt/reGGvkk8NfTzwAA/G5nJYJfnT3WxaLHNZQ2H2IzHvXPqYWyv0w8oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y293yVayNo0HaB/Xu3Rp8QzWFKofvbzUd755k18cLy4=;
 b=KA8YaEe76KKCpM3mVtmpMdcASf3pnKz4mZf56l5suYZohZfgF7IZwtiSptUXuiEyYow0K3rDFwIarj8fPENAy+HJTlwXzCJ1sUAuCwfmmEmpN3bZYmIspQWh7oGCpabjuY2+JZi2d1HIicNqT6sv+UWYigmLenGOoIrkAqjeqelyKmAojzRGnSZTKmU9vhSrUYxAzLGGg+hnfqwAOOB/UqK4g/tFHzeSyEv9l2LsNm7kAG8zQXLRLcXu7AkHiRpa3lSNDQeg6lqtZqNl3xpZqNhwUEADxIPlLgIkdJjyVEfvZkDYEvCl/ru47IRRjJbLslauAFkByZ+dAEZtL/9B1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y293yVayNo0HaB/Xu3Rp8QzWFKofvbzUd755k18cLy4=;
 b=Qofav2MNH96Qfyj6L0MfMX0sVNh2P5Uivgu2+9GYNPSM2HTiEZOPeJs8nDteJQEPWJ3gw2dn5uORXqjLsvaPqHDYwjwC/fgu6pO3S0b+4cwegOnUfj/JRKNm2WPgKKYTxHOqi/CG+gQ0/CFO+513fwOZ6JiZPIu2Q96evTPk9KM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1663.namprd10.prod.outlook.com
 (2603:10b6:301:7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 13:49:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 13:49:22 +0000
Date: Mon, 6 Dec 2021 16:49:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org
Subject: Re: [PATCH 1/3] drm/ast: Handle failed I2C initialization gracefully
Message-ID: <202112042126.N4Qr3RiC-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201153100.403-2-tzimmermann@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0056.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::8)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by
 JNAP275CA0056.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 13:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b5777ef-b5b0-4b66-3d7b-08d9b8bf34f3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1663:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1663C399D4FAF7F31E3B0DBF8E6D9@MWHPR10MB1663.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2n8yikAmODfq+0X8DEKwr4PcPO4zEyUCPMRrerUR09e7LyMr2h6vQh//5msVz0B688+IqAS6g7wPOsm3pFphUBvH+2vMclYGUUgJ4A+YBR0BIqMSQTNt4PZFuie5ho1FviA+vC+FmGhOvD8LYS2g6WZuO5HfdeNNc26vXFU8B+UhZ2eBfT016IK6fisNArYdkBNrkvIemjKbtF2SHya0pABtjSqKzjBnG7h+gC+ThWjiWU7HWRoXdDcbOVs35KUIHacKCcHwhcsolvwFp/qbeEwf8PrtuiaVMIJggVU5R+Jfm/oiFcS8fAVGMM6qxkJ+8VtimUgzd5+GkLlCYGTJKz7Lmk1YLDofkQdGPSxsbcr321drOHNO3LFP+OAYt/6W/IvBdPu7R1uSkAtPYAGyT4M2xvHMzSzbt39cONDMiq0AjwelLZq9eCcEoY/OxUo5SO/HohwK4KMZbmDv1SjG0apdLmQBhTQ6tYG/r8T8vcqyskpSXg8Y6++eZ+KmzuXHnd4eGwB7WcXyNDU7iEusYlncU/Ys0zhSlu0/eKG4wwD1y0vIOPdIGl7O99/SU7X+NN6TqHxvxTOen9bTpNJvy5DkXnY9mmXxdvv1lGSvnyFzIX5xxC1/UsE/U5wMS9QhbFesf0YEMNlNc6w0kXFmRae4Hit7g41yIhUbB0vwr0fHo05zk4WAQKtMefRIrPN+pZhA6TRwz1dJs6SQHcgMdTLjYETfvtPbW74D9mBktt2m2HtQbWiNZJdVUNCj07+TerirgMT5lr568gQdgYC8PYM2Gfqo3YFxSmLunV3XaEDdsAqUU6cHyxV+eN2ZDWdbbVkYuLnvZaj0aM6lBwbyVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(6666004)(83380400001)(86362001)(2906002)(66556008)(66476007)(186003)(966005)(316002)(6486002)(5660300002)(508600001)(36756003)(8676002)(4326008)(66946007)(26005)(52116002)(38100700002)(1076003)(38350700002)(9686003)(956004)(8936002)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1mY507CcX6SmVesbriPsbpULGIr1QxG/cALJECsLX+cD+dUM6RH4G2OuSCZ?=
 =?us-ascii?Q?v6HCQPQ24ALiNimocvwsq1PkuAhSxlrFSxOigWNt1vT52alU7H9sG9OM7q5Y?=
 =?us-ascii?Q?kPoys5tHR/eLJUl9lfboLhakfKTlcfU3STk8xEIxRmSJRrMH3Z3uZns3ht2N?=
 =?us-ascii?Q?jg3MP6qOpGl8KA6vHxCkmYux/LWAN2IrGlXBV6QstvWZSSdxTou2Qr5RVyJX?=
 =?us-ascii?Q?79+Ak3BBI8aRNCSZJ27xD1UeE7bzD2V3yoc7+/yJDguZV5llHR5Vsp374yNY?=
 =?us-ascii?Q?qKtvmgLw7k1RE/Ofual2zUxXCCFQaC3jqtWw3RJV5vMBg+rNvxoh0sJxMnrj?=
 =?us-ascii?Q?syo0PFR7qvhOSatoWBLcHvWsYI6CG+uZfAMM/znRTHElRZLUVOxqr+Fu7Ic5?=
 =?us-ascii?Q?mBkQPpooYS9lsKqMZpv5d+USFL9jUlcj53lXoxn4uTMLq7ofXNWVIgphckKa?=
 =?us-ascii?Q?2o1xOWs0nqOPJlBM9AG1SGJA+9KHFPay7jUl7ww0H0C01vDFqbvDSKc81Fbf?=
 =?us-ascii?Q?CdFEzDydv9HO9taVWAw+fzI92A3q98WJd+nxOOFR1cInyyANKvtOA8RfadUh?=
 =?us-ascii?Q?LrSYqAXezDedMg8Y1yTZqthHKyywdt0IJK9njHmEPG1d2Z5q3lC4hkjg+qZ4?=
 =?us-ascii?Q?jbTHpIzYaL/VPaup2afcZXgifDdKXbqHYP70jdYNW+PIWfZOQD/mPgusoZWr?=
 =?us-ascii?Q?QOa1v/bMLZQzKcx9XOoDNT9HzMS0WUwKI0j2fQoZPxJdyDmrXbWgBgttzexG?=
 =?us-ascii?Q?yPFJNXH5Q57LgAbHl9tTBr7WEiJ96BAdd/eUFKxhoYkz8T4hHL2aZKFp+dq8?=
 =?us-ascii?Q?AOodjHByjsnm6qWSAxTxJsSsCQQJuNig0KPZm0ebcNq30zU+TQwrJ5AoIY/W?=
 =?us-ascii?Q?7HDGx+Lk1dYbnu6Tkmz7iGV+drjLkOQ/FUx0G+4/R1JQv/qxfoV7rIc1mH/r?=
 =?us-ascii?Q?/v04EjNL4zZiEFxWIPPZXgOW9qCvqaFZQrrfq04FBKO+3+JdIhRbMDbUVhzN?=
 =?us-ascii?Q?eDaGotIlvDiBSiftiZ3Ib7IzkJPpB3ime2PX8dB8Uan6fhNol9dmthwg+ApS?=
 =?us-ascii?Q?h2QJ2uuf94JMjo42E7wT2XKvQzxv4KOvN5/jHtVgHMGo8ErqJETiNlNbVgcY?=
 =?us-ascii?Q?0TmMkQuXorl2w7jvKySnuiziB8dclQjq7IMdh1Oaxejs6aOlDgCrM6iLkeo+?=
 =?us-ascii?Q?blUtPFjg+8lQmKpfuq4UV3dZ90KUBq3xRi6wXWvz1P4k9feJYpGZKbYALA6V?=
 =?us-ascii?Q?ejdaIGjNV1d1IGOg/YjSIq0tZ9Jw/DFnjfsqcwA2to7qtPbPNkunFKUtI7Vs?=
 =?us-ascii?Q?YuM0xZEUDX7q7lDlzdaW3sdjZ288x9S5TGa7NFRL67//+1qfu+kYBL5l8zc/?=
 =?us-ascii?Q?85AuEAj0mYLbmVlrd+H8EkGJTxwq9hkQG+hTzeOgSRbKJS31kgJFJ/wGagIh?=
 =?us-ascii?Q?L8H7fdWz6ObK3Zf+BKZi5qxzUcF/ADENWg/2wVUpUIsXT2N2vByWHAGmfH1y?=
 =?us-ascii?Q?zeMSR45kMIaCWNMJLBeo2wKfu1ndO+61z31mDm6Zk7SfCGtEgpQtJmuiPm/N?=
 =?us-ascii?Q?4lrEjOQnzMrMXUDp9BygFt0aUtarTX8j9fhQWx1fbCIWLTq0gTqxxG3ECgwB?=
 =?us-ascii?Q?0fG3GfPe3CJLcqiuOvrkqTxtiJLMWPj4lqjLZB5jjpypiP/VFGL5udS+kqln?=
 =?us-ascii?Q?E7Tp3mhAtPQbm+73b1j5nb50hUQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5777ef-b5b0-4b66-3d7b-08d9b8bf34f3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:49:22.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGnK+txVISuv9bzs8vwnABPHVYQUjtwc4hj+QlvjDzu1McTNVKfCF+8Urmlp+CLbh6lQIOKc/TR1Z3yiRrALyXj1bT1KhGnETcQWuRB1BPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1663
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060085
X-Proofpoint-GUID: w0XgSh9-djTJxZWeDIfC-oEM0p_wOXc0
X-Proofpoint-ORIG-GUID: w0XgSh9-djTJxZWeDIfC-oEM0p_wOXc0
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org, lkp@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/ast-Fix-I2C-corner-cases-wrt-init-cleanup/20211201-233308
base:   6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
config: i386-randconfig-m021-20211203 (https://download.01.org/0day-ci/archive/20211204/202112042126.N4Qr3RiC-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/ast/ast_mode.c:1231 ast_get_modes() error: uninitialized symbol 'edid'.
drivers/gpu/drm/ast/ast_mode.c:1232 ast_get_modes() warn: passing freed memory 'edid'

vim +/edid +1231 drivers/gpu/drm/ast/ast_mode.c

312fec1405dd54 Dave Airlie       2012-02-29  1209  static int ast_get_modes(struct drm_connector *connector)
312fec1405dd54 Dave Airlie       2012-02-29  1210  {
312fec1405dd54 Dave Airlie       2012-02-29  1211  	struct ast_connector *ast_connector = to_ast_connector(connector);
fa7dbd7688849d Thomas Zimmermann 2020-06-17  1212  	struct ast_private *ast = to_ast_private(connector->dev);
312fec1405dd54 Dave Airlie       2012-02-29  1213  	struct edid *edid;
                                                        ^^^^^^^^^^^^^^^^^^
312fec1405dd54 Dave Airlie       2012-02-29  1214  	int ret;
83c6620bae3f14 Dave Airlie       2014-03-28  1215  	bool flags = false;
6c9bd4432b2527 Gregory Williams  2021-07-30  1216  
83c6620bae3f14 Dave Airlie       2014-03-28  1217  	if (ast->tx_chip_type == AST_TX_DP501) {
83c6620bae3f14 Dave Airlie       2014-03-28  1218  		ast->dp501_maxclk = 0xff;
83c6620bae3f14 Dave Airlie       2014-03-28  1219  		edid = kmalloc(128, GFP_KERNEL);
83c6620bae3f14 Dave Airlie       2014-03-28  1220  		if (!edid)
83c6620bae3f14 Dave Airlie       2014-03-28  1221  			return -ENOMEM;
312fec1405dd54 Dave Airlie       2012-02-29  1222  
83c6620bae3f14 Dave Airlie       2014-03-28  1223  		flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
83c6620bae3f14 Dave Airlie       2014-03-28  1224  		if (flags)
83c6620bae3f14 Dave Airlie       2014-03-28  1225  			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
83c6620bae3f14 Dave Airlie       2014-03-28  1226  		else
83c6620bae3f14 Dave Airlie       2014-03-28  1227  			kfree(edid);
                                                                        ^^^^^^^^^^^

83c6620bae3f14 Dave Airlie       2014-03-28  1228  	}
75bd8f71712a8a Thomas Zimmermann 2021-12-01  1229  	if (!flags && ast_connector->i2c)

If "flags" is false then "edid" is either freed or uninitialized.  So
if "ast_connector->i2c" also is false then that's going to cause
problems.  Hopefully that part of the condition can just be removed?

	if (!flags)
		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);

312fec1405dd54 Dave Airlie       2012-02-29  1230  		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
312fec1405dd54 Dave Airlie       2012-02-29 @1231  	if (edid) {
c555f02371c338 Daniel Vetter     2018-07-09 @1232  		drm_connector_update_edid_property(&ast_connector->base, edid);
312fec1405dd54 Dave Airlie       2012-02-29  1233  		ret = drm_add_edid_modes(connector, edid);
993dcb05e47e35 Jani Nikula       2012-08-15  1234  		kfree(edid);
312fec1405dd54 Dave Airlie       2012-02-29  1235  		return ret;
6c9bd4432b2527 Gregory Williams  2021-07-30  1236  	}
c555f02371c338 Daniel Vetter     2018-07-09  1237  	drm_connector_update_edid_property(&ast_connector->base, NULL);
312fec1405dd54 Dave Airlie       2012-02-29  1238  	return 0;
312fec1405dd54 Dave Airlie       2012-02-29  1239  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

