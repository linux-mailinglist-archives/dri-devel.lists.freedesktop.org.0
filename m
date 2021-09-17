Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D640F662
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 12:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CA06EC22;
	Fri, 17 Sep 2021 10:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01396EC21;
 Fri, 17 Sep 2021 10:59:16 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H9bTrZ009091; 
 Fri, 17 Sep 2021 10:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=1RuBMXNf2imQ6m9WFOEHzb5vgvdNWcH9iKCdezXUQSE=;
 b=wfrE9gwJ0LRqOHAeJFYpxrk/g4dpMmVK9UyEQ+qqiO0aQaPcQwK7C9zCkfACvavttpaJ
 6IoRqi4S5bdp5WUZiYHYJ0kRrp6zJCKOo18lJPfkxyLNikckEZCyKb+ix05VAwh+Hm68
 0pMzsyCjMLjA7Fqs7988omt39AGzdW9DkyfG99ByOjn5IGnNQIALdg7zVoyE5aedR3lk
 462Jpg4t+Av5I0PiGiubxoDusi6Kvz4AvhTMFGL+0lTHoQlELRdBcFlIA7NkFfmHunCh
 3QXp/jL0ptG4L9+yh2cOfFWa9KpNGL51p0UNNLB1MuTQ9RmLf4LIzubh8xTh/mqK9aMc Bg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=1RuBMXNf2imQ6m9WFOEHzb5vgvdNWcH9iKCdezXUQSE=;
 b=DaTW2oHZ8ONupMeTxJbngKllBH+rj7hOXeHCfsGVxAB9iohfW25wDc3Ic4xL5AsPthso
 iSczLhZO7X4+gDEToTdhraiRYoOYJQO9sxrOU2N6XlYEoQummbW8ANgSWFMyMtqkGWpt
 Rqg9Q83te+czAwoehb2vseIG6oXAbRxw78Mm4MLs2c2ayOBTiNObFYRTVAXnAq3R+7SV
 z3B1Ytcj5jISQzMU5NvK6LI3/bqo6TLqBcBa5extDYt7Kcx3ktQaeZVkB9vdITLTJ7SS
 O8s/2DXwcoAFJriqebXz1G2ea6vzJhbyIyWfEvyEWIr6T8HCUYRmoKxLE/mtNxSa4Zc8 tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74p46n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 10:59:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18HAtkmi137141;
 Fri, 17 Sep 2021 10:59:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by userp3020.oracle.com with ESMTP id 3b167wmy40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 10:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAe0KMdFQQxDrvLUkhKFFbSkYJpeEQmwKTYHPpHzbNNbarWgG6bszPC+NLtQCISjyekslc8yZNSOf8n4cf0wlD5kBljXskz2Bg3T6tquwAk4c8aF2DI6TxZdjQdKGnQuSIP5p5KW9/YmjlA3KXqQK9svgRN9Yz7dGcknoLX4JdwBpdYVy83IYV8qEOANHf/9E9CD4CKG7jsgsj8ZYS6dV6ywbflLn2HsWdzW7sXysIQ9KJNLDrBPsfgva0UvK3ZI5jreT8XDxA7Z3wEgsyY76SeqARaVS66kSEXqUBIAWF1+s4AIUBFcy6Ng7cmYDt+Dwb2+3VQw2FTy1UkAZpXSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1RuBMXNf2imQ6m9WFOEHzb5vgvdNWcH9iKCdezXUQSE=;
 b=h+VUBIuX7xbOgrTZ5sNGSlwfSNr86O/0Jidaj5WRPlbShuFQRGJZHvJ7y7n6LxhJW+fwfijkoDtugf0Bzka0Qg5grwY8d1qtOhxwRnjiSSJW1VhcNLiVhu70ejVb1Ze6jZ8FyiyEC0v4JCbN+8fZSGUBkzr2NzhLL02B8dLO83AoOhZHB8taI3PwOm+ledr1/X6Q6R/EHZXB4MFDCjzoTaH6sEpHx4LJPRqgUNablJTQiBmld7riGX7RghyEdpzSZNgFzMhFwDSl2lI+XdNygxXfOoImshe6YhxuOXRAUjRtnrtWrbn3g7jT4V4PiuCQgchBU224VdNiEZL3Tx8V8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RuBMXNf2imQ6m9WFOEHzb5vgvdNWcH9iKCdezXUQSE=;
 b=dSIZL92HvmmEqfgqa1QakEj5Muakag9JhUiQQsQZz4QM+uuy1B0OHn3GwxUtCN7Hbg4EHB+H+bRen4CxdPCrSqxnXuArJqYjwWST5JA29uNOv4uAsUAkNQGwy56wO3o+EuZcvoQeGFmdSCYiF1ndP5WCPa8G2CpIT9+jxj5qupQ=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1888.namprd10.prod.outlook.com
 (2603:10b6:300:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 10:59:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 10:59:05 +0000
Date: Fri, 17 Sep 2021 13:58:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: lkp@intel.com, kbuild-all@lists.01.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [kbuild] Re: [PATCH v2 04/13] drm/hdcp: Expand HDCP helper library
 for enable/disable/check
Message-ID: <202109170917.5gPBFFFL-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915203834.1439-5-sean@poorly.run>
Message-ID-Hash: DK7X7XUGNON6VZIM5RZK6LMBXD5QCA6X
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0045.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23 via Frontend
 Transport; Fri, 17 Sep 2021 10:58:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2866ef84-f9e1-45bf-f7bd-08d979ca2a2f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB188803EFD29F5FF7F21A82CF8EDD9@MWHPR10MB1888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xKu63X4NfDKMh+jNW2a6W3DkQRzyQPY2YQHcDlIE1U7tGOm5nJJoQUo0z2RIzDsALwsSnvzsekLBs17rg6Pt0cprtT3qoRQB0Q90GvnhM25lXYoz1cJ6aWevBHIVSkzXRUphjtuFMH4Quaj5aYYm1oIffUloBPDt2JOZGBiqhwqKXl0BH83JIoe8VJ/nuUWO3/PVlZkzqtF44jIsRAioqKDFSmY00VdhDXytlNy/WVzmi7pwx+xI23jdGfA2W381c31DiTUoB/7OapvDPHzfLouPL46Mv0hv3A8xM55axXn/8tmIhxV0Tf6ZgNIiqijO+gVWP4LBRawMiP2Ie+46DidcPm33fF7G7lnys1s+YPYf3J/jQe4xskL5s0woiiE3gKlDSsI/3nprV6Mt9RBlg9/LqyUu+xVwTGGvOQEdlZ2Yo3QzZC1CLnis1wNlMXZT3uW4HDBI+7AydrDTpcVzqHXq0xd49jrS6hOb/bF9NytDwn5q/ohP7tDpDIbXHiLNQ1YYt51AMu9RzwskQGqUSGb6Z70nx7YAqe4FsBSASMOkJ1rW1nbrRqenHGRUpWgsVindrCg6FOZV+relv1/HFtQ/0bTHMFQCNhShG+b139j1DMkjQa+VOwNEm5nIDUR2dEu37oMT13xzU7N57y0LClqtBVE6adnPgWOFfzQQg/AE532W4h2h6fK+Cg7Oe8NnWuBZx9/iaYY3EXGgp0FMr2nFncD1/W5NjJldVcfVB4XU36bjRoLXrKZ6C/Tkw1ZTxNGVtYXHKE/cojmcQdTGkGQU9hlw2h0KKqV0dRXfD4HJfvu4Ykxp1gAppUBehmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(54906003)(52116002)(44832011)(956004)(8676002)(8936002)(9686003)(1076003)(508600001)(6496006)(6666004)(36756003)(66946007)(26005)(86362001)(966005)(186003)(6486002)(7416002)(4326008)(2906002)(316002)(38100700002)(66556008)(66476007)(5660300002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F1o5oI9VOg5SLZVz2x4vcUVIvngcfFW/5z5iJSjqqtP4+DOiZ04BH7yKZPzd?=
 =?us-ascii?Q?57e435xmfaC0o9Ybl5fjuLbKmNNimv1XWo5491dKmJxan0Ic5y9a+wYFEMvj?=
 =?us-ascii?Q?FHgBs8ruwcWlduPGHwuww+sdrNFFMfqQL4azjGD5/Nt6Yd/d4rzN+nMlxyaE?=
 =?us-ascii?Q?bGT4NOReCBW7H+eREkRWcAHyUISv0yfv/xc7m4bqvRBdK1o80UKPANbJgIuE?=
 =?us-ascii?Q?/5L/WIX9ynKa+rxKMBoB5y/n3MdSFm8LBv6pli0q9LZU3w9uU7wgod2BgJfg?=
 =?us-ascii?Q?1GiojEsYkB5kxRPwQwh1Yv/gTnPYbb0i1yAvOXfXbYrveqIjuFKuh0u6oRKW?=
 =?us-ascii?Q?zxROb/7aJ54hgNEZSt2Ry/OqdjW0fH3XxUir6DbB8aIu5aMoZRr5V+Ubij6S?=
 =?us-ascii?Q?yqg3t9GQyTRYl7YfIUamtk1B3pLipWH+EK3cN/egy9CHPuU4usMwqaCyXLJK?=
 =?us-ascii?Q?cnh//7Upy5WYkCnUBdydN9c+OAI73iO9ZOSJI5VRpnlHK2x4StZ5ftN53hCS?=
 =?us-ascii?Q?KEPRMI/pGUpiPZBH+kNqr/AaGt3+Yl3znJ/JYkqYDYUfioJgbfqM3LyIBO6w?=
 =?us-ascii?Q?6tMoU3aNolUs9eAog8o2MZSZcX1VWQ501zR+tJ5CFTE3lxsUho3rBrZ8czVd?=
 =?us-ascii?Q?p7Rd7ANxUS6xLUMS+i9Tkduif/cP5+dEie9LMy5Co0bVlDe5Lh54SbDdDmnK?=
 =?us-ascii?Q?mkQF533w1JPYzjTC29jPNHVglZKAFZTwKEd2FTASwwYsMAGOS0DCgRCyR7ej?=
 =?us-ascii?Q?71E04sxW/Zl1X7+7I+iAHQsPthJfOEepreUUi3e/og66AeMvy9jL7/aTGcjo?=
 =?us-ascii?Q?KP6eINi5HtbfNhrrIIBX30hw1SJAHFZ/ycbyXzJFF3dU1IBIiTvkHs0KWIp4?=
 =?us-ascii?Q?LWcIV3xKhSAZ3zJo1RFwkYaPowllIpgBwPW8/FTvGfeTOBlQup+cJB0K50Fy?=
 =?us-ascii?Q?PAAY86SrLMf6fpVAllz93lIVzU/xi5LPHE8eguSeAfLZdBxmNFSItGFiOU/m?=
 =?us-ascii?Q?iqrvkQhFK3r9TJ3hYGL/6CISpTQFExDcXoohExurKoFGYlT3M+/fBzi9v+k2?=
 =?us-ascii?Q?sNj8Uvd/4YfcoiBgPQ3ck/B0whZ9BMITnsuPb4IwfP3SCg2osrnZQIdupssl?=
 =?us-ascii?Q?ecbtodToNwHqzN+Cj/NU7EOueBzxE+HY+sDmqOz9hPJiUS+NH7XRkSUjd6ax?=
 =?us-ascii?Q?G616bPD5Re96CeB1hcOl+hoXmIbA+NaZYxKkeJpClzGd4/UgYHQe04M6MEA0?=
 =?us-ascii?Q?D4lD4Ep/+ZlecyOQtex+wPpM7QcC4wkQe5OTu3OkEvaszADA4BgB8kiHgzOG?=
 =?us-ascii?Q?lfdwc0jhHfavErZJhpEAreGR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2866ef84-f9e1-45bf-f7bd-08d979ca2a2f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 10:59:05.0995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klkIAZDZu02GlhP/M1dKzu0eQ/M5hgM1uKcxBzLHDiqMBJZ7dmoR+/4Px+s6HAl2lxnj6WPUP6GYNxQyLj80eUcGMeNxgl2ejfpQuLBZpgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170071
X-Proofpoint-ORIG-GUID: OZAKuFCE0iwqLFlNnO1BLWuWJDQOa7wn
X-Proofpoint-GUID: OZAKuFCE0iwqLFlNnO1BLWuWJDQOa7wn
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

Hi Sean,

url:    https://github.com/0day-ci/linux/commits/Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20210916-044145 
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-m001-20210916 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_hdcp.c:1208 drm_hdcp_helper_enable_hdcp() error: uninitialized symbol 'check_link_interval'.

Old smatch warnings:
drivers/gpu/drm/drm_hdcp.c:514 drm_hdcp_atomic_check() warn: inconsistent indenting

vim +/check_link_interval +1208 drivers/gpu/drm/drm_hdcp.c

cbc5065be3a652f Sean Paul 2021-09-15  1127  static int drm_hdcp_helper_enable_hdcp(struct drm_hdcp_helper_data *data,
cbc5065be3a652f Sean Paul 2021-09-15  1128  				       struct drm_atomic_state *state,
cbc5065be3a652f Sean Paul 2021-09-15  1129  				       struct mutex *driver_mutex)
cbc5065be3a652f Sean Paul 2021-09-15  1130  {
cbc5065be3a652f Sean Paul 2021-09-15  1131  	struct drm_connector *connector = data->connector;
cbc5065be3a652f Sean Paul 2021-09-15  1132  	struct drm_connector_state *conn_state;
cbc5065be3a652f Sean Paul 2021-09-15  1133  	struct drm_device *dev = connector->dev;
cbc5065be3a652f Sean Paul 2021-09-15  1134  	unsigned long check_link_interval;
                                                              ^^^^^^^^^^^^^^^^^^^
cbc5065be3a652f Sean Paul 2021-09-15  1135  	bool capable;
cbc5065be3a652f Sean Paul 2021-09-15  1136  	int ret = 0;
cbc5065be3a652f Sean Paul 2021-09-15  1137  
cbc5065be3a652f Sean Paul 2021-09-15  1138  	conn_state = drm_atomic_get_new_connector_state(state, connector);
cbc5065be3a652f Sean Paul 2021-09-15  1139  
cbc5065be3a652f Sean Paul 2021-09-15  1140  	mutex_lock(&data->mutex);
cbc5065be3a652f Sean Paul 2021-09-15  1141  
cbc5065be3a652f Sean Paul 2021-09-15  1142  	if (data->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
cbc5065be3a652f Sean Paul 2021-09-15  1143  		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
cbc5065be3a652f Sean Paul 2021-09-15  1144  				      true);
cbc5065be3a652f Sean Paul 2021-09-15  1145  		goto out_data_mutex;
cbc5065be3a652f Sean Paul 2021-09-15  1146  	}
cbc5065be3a652f Sean Paul 2021-09-15  1147  
cbc5065be3a652f Sean Paul 2021-09-15  1148  	drm_WARN_ON(dev, data->driver_mutex != NULL);
cbc5065be3a652f Sean Paul 2021-09-15  1149  	data->driver_mutex = driver_mutex;
cbc5065be3a652f Sean Paul 2021-09-15  1150  
cbc5065be3a652f Sean Paul 2021-09-15  1151  	drm_hdcp_helper_driver_lock(data);
cbc5065be3a652f Sean Paul 2021-09-15  1152  
cbc5065be3a652f Sean Paul 2021-09-15  1153  	if (data->funcs->setup) {
cbc5065be3a652f Sean Paul 2021-09-15  1154  		ret = data->funcs->setup(connector, state);
cbc5065be3a652f Sean Paul 2021-09-15  1155  		if (ret) {
cbc5065be3a652f Sean Paul 2021-09-15  1156  			drm_err(dev, "Failed to setup HDCP %d\n", ret);
cbc5065be3a652f Sean Paul 2021-09-15  1157  			goto out;
cbc5065be3a652f Sean Paul 2021-09-15  1158  		}
cbc5065be3a652f Sean Paul 2021-09-15  1159  	}
cbc5065be3a652f Sean Paul 2021-09-15  1160  
cbc5065be3a652f Sean Paul 2021-09-15  1161  	if (!data->funcs->are_keys_valid ||
cbc5065be3a652f Sean Paul 2021-09-15  1162  	    !data->funcs->are_keys_valid(connector)) {
cbc5065be3a652f Sean Paul 2021-09-15  1163  		if (data->funcs->load_keys) {
cbc5065be3a652f Sean Paul 2021-09-15  1164  			ret = data->funcs->load_keys(connector);
cbc5065be3a652f Sean Paul 2021-09-15  1165  			if (ret) {
cbc5065be3a652f Sean Paul 2021-09-15  1166  				drm_err(dev, "Failed to load HDCP keys %d\n", ret);
cbc5065be3a652f Sean Paul 2021-09-15  1167  				goto out;
cbc5065be3a652f Sean Paul 2021-09-15  1168  			}
cbc5065be3a652f Sean Paul 2021-09-15  1169  		}
cbc5065be3a652f Sean Paul 2021-09-15  1170  	}
cbc5065be3a652f Sean Paul 2021-09-15  1171  
cbc5065be3a652f Sean Paul 2021-09-15  1172  	/*
cbc5065be3a652f Sean Paul 2021-09-15  1173  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
cbc5065be3a652f Sean Paul 2021-09-15  1174  	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
cbc5065be3a652f Sean Paul 2021-09-15  1175  	 */
cbc5065be3a652f Sean Paul 2021-09-15  1176  	ret = data->funcs->hdcp2_capable(connector, &capable);
cbc5065be3a652f Sean Paul 2021-09-15  1177  	if (ret) {
cbc5065be3a652f Sean Paul 2021-09-15  1178  		drm_err(dev, "HDCP 2.x capability check failed %d\n", ret);
cbc5065be3a652f Sean Paul 2021-09-15  1179  		goto out;
cbc5065be3a652f Sean Paul 2021-09-15  1180  	}
cbc5065be3a652f Sean Paul 2021-09-15  1181  	if (capable) {
cbc5065be3a652f Sean Paul 2021-09-15  1182  		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE1;
cbc5065be3a652f Sean Paul 2021-09-15  1183  		ret = data->funcs->hdcp2_enable(connector);
cbc5065be3a652f Sean Paul 2021-09-15  1184  		if (!ret) {
cbc5065be3a652f Sean Paul 2021-09-15  1185  			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
cbc5065be3a652f Sean Paul 2021-09-15  1186  			goto out;
cbc5065be3a652f Sean Paul 2021-09-15  1187  		}
cbc5065be3a652f Sean Paul 2021-09-15  1188  	}
cbc5065be3a652f Sean Paul 2021-09-15  1189  
cbc5065be3a652f Sean Paul 2021-09-15  1190  	/*
cbc5065be3a652f Sean Paul 2021-09-15  1191  	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
cbc5065be3a652f Sean Paul 2021-09-15  1192  	 * be attempted.
cbc5065be3a652f Sean Paul 2021-09-15  1193  	 */
cbc5065be3a652f Sean Paul 2021-09-15  1194  	ret = drm_hdcp_helper_hdcp1_capable(data, &capable);
cbc5065be3a652f Sean Paul 2021-09-15  1195  	if (ret) {
cbc5065be3a652f Sean Paul 2021-09-15  1196  		drm_err(dev, "HDCP 1.x capability check failed %d\n", ret);
cbc5065be3a652f Sean Paul 2021-09-15  1197  		goto out;
cbc5065be3a652f Sean Paul 2021-09-15  1198  	}
cbc5065be3a652f Sean Paul 2021-09-15  1199  	if (capable && conn_state->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
cbc5065be3a652f Sean Paul 2021-09-15  1200  		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE0;
cbc5065be3a652f Sean Paul 2021-09-15  1201  		ret = drm_hdcp_helper_hdcp1_enable(data);
cbc5065be3a652f Sean Paul 2021-09-15  1202  		if (!ret)
cbc5065be3a652f Sean Paul 2021-09-15  1203  			check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
cbc5065be3a652f Sean Paul 2021-09-15  1204  	}

"ret = 0" and "check_link_interval" is unitialized on else path.


cbc5065be3a652f Sean Paul 2021-09-15  1205  
cbc5065be3a652f Sean Paul 2021-09-15  1206  out:
cbc5065be3a652f Sean Paul 2021-09-15  1207  	if (!ret) {
cbc5065be3a652f Sean Paul 2021-09-15 @1208  		schedule_delayed_work(&data->check_work, check_link_interval);
                                                                                                 ^^^^^^^^^^^^^^^^^^^

cbc5065be3a652f Sean Paul 2021-09-15  1209  		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
cbc5065be3a652f Sean Paul 2021-09-15  1210  				      true);
cbc5065be3a652f Sean Paul 2021-09-15  1211  	}
cbc5065be3a652f Sean Paul 2021-09-15  1212  
cbc5065be3a652f Sean Paul 2021-09-15  1213  	drm_hdcp_helper_driver_unlock(data);
cbc5065be3a652f Sean Paul 2021-09-15  1214  	if (ret)
cbc5065be3a652f Sean Paul 2021-09-15  1215  		data->driver_mutex = NULL;
cbc5065be3a652f Sean Paul 2021-09-15  1216  
cbc5065be3a652f Sean Paul 2021-09-15  1217  out_data_mutex:
cbc5065be3a652f Sean Paul 2021-09-15  1218  	mutex_unlock(&data->mutex);
cbc5065be3a652f Sean Paul 2021-09-15  1219  	return ret;
cbc5065be3a652f Sean Paul 2021-09-15  1220  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

