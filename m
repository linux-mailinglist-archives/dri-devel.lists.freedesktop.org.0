Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5A3CD083
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 11:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A0D6E0C5;
	Mon, 19 Jul 2021 09:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72886E0C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 09:21:21 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J9GNNE005305; Mon, 19 Jul 2021 09:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ULPKRVrB8o/4LeNo2TGgOL5D3qxrRA+93DJyv7YHq4Y=;
 b=KSdq5SfEdaTV+ozgX/H5y/1UUNkWAhw8ZmvtzWm6fsPkyOQx86NqZP1732GA7vmWav00
 aU6qQoclvXEcLYzLzsHJxUBUfDIHK6kuhmoRKC+++32QWJP4qczoSEnHOjThtImf2lGl
 EG4NQDR2Rd6LVfiF444w2FET/FhBcaLow59avnC1JR1wdYXV/hCdZLAtTgmF7TPWpnE7
 zJSb+jEJ9CoAaEwx0qhlvaPx8yKD4IKL8rSJWLPqVDEG3V3qa44Tw9FKoHnYXyViyRLq
 wLGAIqFkMOEEuH+X+rVND7bIP01PRATGkMW8Iq/Fy2kgu5Brq8qVrerxNimltDvpOGJb TA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=ULPKRVrB8o/4LeNo2TGgOL5D3qxrRA+93DJyv7YHq4Y=;
 b=QHK+lCzDS/QS/oWIb3XZXugg5uLp5nAWZba4MRrhi/PiW/vc8hMhqocEhOPhaZVTHb1I
 5uaq0viopNw0GgYA4gW0RKYMMXQ+izafp6OJD+CXTSis54CIcwtsYHUsJJhsVlKLkkhY
 zhUV1zcyxPVI/FAmLLYpIBJBX7JHxwMBfVQXnAPk8ndkpWMDY0+8hPtMeg8eWPZHw4C9
 66A6b7dkl5LHmDswtqvAbKs7iuAmqf9XKrAgrtONe5BWDmWWCT6KaNEhJoWz31wjNauV
 wrT1HXqmJIrTld5TyBZO1tXumrO32uN0ETfzOipZvMtaYztg/egYdSO6ht448GJXnbsA oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vqm990f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:21:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J9HdJG080004;
 Mon, 19 Jul 2021 09:21:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 39v8ysaum8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neddvA0s5UgyzdlY5AYc0vdMGfy3IFaWNCUHzksBgMpi7NYmEgIdFQDE+LKC0Fet7N9GeAewExNq43rTYCHHltwikVw4/AkX1oeDuvfk7KC6QU9ycMjYFj2dFoSQ4stsiydJQ4Y8r56c+lDSUuaHgpdy4Jvh2szLC4Zf/4l2pllMEwX68vwF9jZqHDJ+bLUBXXWJqAevgdILsuVyOpv5ICVv+vtsB1IysLsSoHs0+EK1Q/umaV16IClmH8XEVfd8rZWuofYC7Y6Z9yY3er7etwB/e984BVRpd4cp0ljeJwlG9P1pTm91QO5oKc/jSrtHDS/DiaFd5CAg+UhDU93WNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULPKRVrB8o/4LeNo2TGgOL5D3qxrRA+93DJyv7YHq4Y=;
 b=OeAXLYZW+Sno0cR+Yp7Y8fAOxTtUN1L0Llfcv0yYqClipTde/b45vEUHZuED0N0D+PTNOEbXGu+h0ZBuHblb8p2ujTPasib6BcFqnEOcalCfO37Dagwgrr7KDu6bb00wSEETbDrVu8+dp0EmnTe+ZceVvYdE6SfxkdsiTWXYJ+fLJi0goCHI50ABLxhe1OxuSQlSFyGlMLbuPRRlPSxtBy7c6k4GGw2lUOQC9zSNa8bAfug3qDkgiIisDNTsm3j+T/J4gtVGeRg6wowGSstAQ3FQQS8dJPtfcAgeE4+pZLDV5MT2mAE/B9XOhkfopGFRkRf/eYYIiYiX3Oq8OeQ/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULPKRVrB8o/4LeNo2TGgOL5D3qxrRA+93DJyv7YHq4Y=;
 b=basqjwMSRoxO7ifGKg+BjOAyPc+cjbDUtYq8smaSDsm/2FpXPY+2egj0WMK5WOmo3s2tkamMif+ljeowzzvAxcRBzSnzPzDleww5hYt3xF85KFlVGkWukqAAw8F8FDrY8M6bdT9uQqn2xGr5amEA9/xlxXZKkoPefT6hvw4+2FY=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4402.namprd10.prod.outlook.com
 (2603:10b6:303:99::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 09:21:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 09:21:14 +0000
Date: Mon, 19 Jul 2021 12:20:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lichenyang <lichenyang@loongson.cn>
Subject: Re: [PATCH v2 2/3] drm/loongson: Add GPIO and I2C driver for
 loongson drm.
Message-ID: <20210719092050.GQ1931@kadam>
References: <20210715015809.107821-1-lichenyang@loongson.cn>
 <20210715015809.107821-2-lichenyang@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715015809.107821-2-lichenyang@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 09:21:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f96cfa-71a5-4a55-a956-08d94a968df6
X-MS-TrafficTypeDiagnostic: CO1PR10MB4402:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB44025E9652B49278C4E2C1C68EE19@CO1PR10MB4402.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+RxyxYx9frCUuVY+XSkhvlmAn6YvsrdS8l4C9t1BwBHn3NeqooPVVTy/kTDy9hTICrN89BKQbhjqi/j5GqVA8Qo0pEeAv01fCFwzTeeNtW/yIS5GXYYGy83G1wKBs6qwHPbvlq3cQ0BXYD0oZDCDJQqg6CXi7aEDGJCZb18+BhNwTTF8qKzHjQEc8kLlMP0Uh1EY51aml1qB+oJFaWiqrc2mEkC/ctBDwSZfSUySH5mA4Hb0Q2n9JkHaySovmLKr+0WzuyevuLj4KwphlJIHU6oFAIYoeeJml2kgq/zbjd7uLPq54UX8I5QDdRM/kt00jPTwGvjqH7hLtkE+/jRaPzdE/lAdwLHhf8DdDyrE7db0bwHQ0GY6bwnOPKz1jdxTGxBu8z21pvDS4GKzJt+MWV4hkDZMEHkDndR7h3iaep3LTbDNgXbHL2O4YwQcZ3DISfwh2eZ3SsfVMoXfgPjhwUV1UdcDWbqUN/e3Y8Q+lQHMFJBV34noE5m1TLj2w9K0MdWHI/jnhouZTT5Y9drXISf8bqvpb56+I0CE9IMXauczEKVw+ItSud9/O98h/dpUoIhi3qMw+n5kvXGXlHs72CxttAGhdmJeimkeokSKMU/kXUcNcWpl3+mt6OYotaUMkyx4OGExJacRwoxplp0Wf1DOrR9pifkKGhfXpfIY+FLamnHNABA+qtj2GTHw2IdroT0V8cumQfn84yYKPq8zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(26005)(66946007)(38100700002)(38350700002)(1076003)(316002)(44832011)(66476007)(66556008)(30864003)(6916009)(4326008)(55016002)(86362001)(478600001)(9686003)(5660300002)(186003)(6666004)(54906003)(2906002)(6496006)(8936002)(33656002)(8676002)(9576002)(956004)(33716001)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Yt5XrhtopEE9q7gbPNA0aVe+aHCO7nsvgJu6ak6+33/n2w6BdqKQhXcFYfn?=
 =?us-ascii?Q?Yj05qtqRG0+SzIHFj/etBhbk01vCL/7Qpb9Ryi8YwyHDryidCYFHdf01Geoj?=
 =?us-ascii?Q?Yp2+HRgs1/lcpoUBeobeCAX+rqnb83H67FRsQog1SDQVcFeegS2BcJRSYwwX?=
 =?us-ascii?Q?snRo1cyC8JY9YlwnaGUYQzrv86FiomlaqDquu1pHMTngO8X61ODe0OPJR6yY?=
 =?us-ascii?Q?MOK/CJ7Jap0R7d34ofgME97NkVle3e3Nm1Ytw1DtRjaUncl39kz9gfGv7p3V?=
 =?us-ascii?Q?Kw8/0XxduZklCPVCGjLQCLDhtbTw3ERET2vAJh6q7oDzBuvH1azEAFuxWCfI?=
 =?us-ascii?Q?28UULWZYRNpV1IswliI1rLjxRb/I3JC9/45MfmljuoFizzpFw8NKyz3VXWYK?=
 =?us-ascii?Q?avJ6mS1XD15Jj7vQFLXphoAGnIxhCaVhXBKqpDtZ0n+hiLkzJU4Nue9Vx1Vs?=
 =?us-ascii?Q?4bhxilXS3QJV8ajVcwP07JVDgb4193E5KjbKxfrx5i4JFQkacGqeJzQDwDS5?=
 =?us-ascii?Q?3F/VbRQKIs7E7+4JOnoZmYAOSHl7x96CgIC1O1PwOMO0C6N/6VBVUaamQ4vt?=
 =?us-ascii?Q?ZTt5IS92fte4YXsQ4NeFN63e0kIZDNKsaIQTcr3GnEexZQP1T+XBrGMVB6dd?=
 =?us-ascii?Q?aZC5N+14aPhyy1Y7BTbBP6xQM6L5uvlhfjXg3MU5p/lmABg1No8oaBpRWhrs?=
 =?us-ascii?Q?rM0UYVNvlqBjey6XXo9/VUE6CKbYocNRjtYXZKdWJoqU7C5OfVmStnrdC0Tb?=
 =?us-ascii?Q?Dk9P7t5BElEA9APmE/M7v+4h7EsPZYzc4CL3m/82FuxSQCPq4HsBKUHKl6yc?=
 =?us-ascii?Q?tezIhyXR5KiEDF4PEMOsxNKjEQiQ1V1CB0Cl/7J6E+166eAXe+cNSNu21svW?=
 =?us-ascii?Q?HgAfHRBdnlRaxKVINEbkDizaWSGLuFJWkzXEaRJX2jV71EkU1VwkJahEvlCT?=
 =?us-ascii?Q?06tsqL3gpxa/6lTbEyU5KrKOtyUYPXCdaDPI+1IHEmsl33MutNag2n6oiFBl?=
 =?us-ascii?Q?sWbCo0gRiDRsCznIL7zchw58ZEzUN2VG/t1NzULEWgoENqZkao+WNEatciVz?=
 =?us-ascii?Q?yJpApyXdIdTC9qOgYsPEIR3sTf1ChuuKYS+vcCOLUXoSKtMHaZUveb2UfuB7?=
 =?us-ascii?Q?iF/DUUdqaqduElz7mznojgLK+asBnJ6wxH5XZ5nMxvjLJvKOmDpfUbCWSmE2?=
 =?us-ascii?Q?v2bjin4L8acU6+s4IoVCCqh+QBnS+SFVDzPcFV97TLwAbzt1y1fZjfwe5wyf?=
 =?us-ascii?Q?utUAEEGI7r5TIM6tNIGyxs9/vkommMxOn+a3S7+UNWMt0wv19sOMo1cJZxo0?=
 =?us-ascii?Q?gWZb0WeR+JMA9EFgu9MEDh0v?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f96cfa-71a5-4a55-a956-08d94a968df6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:21:14.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXEk/Q+OS6ETtQfeArQbvm2Jzqo4poSsihi6MHfrv0R5A284BW9zgD1g8WBOTErtgdg5sYCSJX+My8pUKELSgnFXoN4E5yFWTNgD4e8VBh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4402
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190052
X-Proofpoint-GUID: t4sFdK0RdkUzln5Ojm9QHy5_ONehkFgr
X-Proofpoint-ORIG-GUID: t4sFdK0RdkUzln5Ojm9QHy5_ONehkFgr
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
Cc: David Airlie <airlied@linux.ie>, Huacai Chen <chenhuacai@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 09:58:08AM +0800, lichenyang wrote:
>  static int loongson_get_modes(struct drm_connector *connector)
>  {
> -	int count;
> +	struct loongson_connector *lconnector;
> +	struct i2c_adapter *adapter;
> +	struct edid *edid = NULL;
> +	u32 ret;
> +
> +	lconnector = to_loongson_connector(connector);
> +	adapter = lconnector->i2c->adapter;

Put this stuff in the initializer block.  It's just pointers.  It can't
fail.  We're not going to change "lconnector" or "adapter" part way
through the function.  This comment applies through out the patch.

Don't put functions which can fail in the initializer block but these
pointers should be there.

I feel like maybe you're doing this to avoid the 80 character limit?
Just add newlines if you need to.

>  
> -	count = drm_add_modes_noedid(connector, 1920, 1080);
> -	drm_set_preferred_mode(connector, 1024, 768);
> +	if (adapter != NULL)


Can this actually be NULL?  Write this as:

	if (adapter)


> +		edid = drm_get_edid(connector, adapter);
> +	else
> +		DRM_DEBUG_KMS("get loongson connector adapter err\n");
>  
> -	return count;
> +	if (edid) {
> +		drm_connector_update_edid_property(connector, edid);
> +		ret = drm_add_edid_modes(connector, edid);
> +	} else {
> +		DRM_ERROR("Failed to read EDID\n");
> +		ret = drm_add_modes_noedid(connector, 1024, 768);
> +	}
> +
> +	return ret;
> +}
> +
> +static bool is_connected(struct loongson_connector *ls_connector)
> +{
> +	unsigned char start = 0x0;
> +	struct i2c_adapter *adapter;
> +	struct i2c_msg msgs = {
> +		.addr = DDC_ADDR,
> +		.flags = 0,
> +		.len = 1,
> +		.buf = &start,
> +	};
> +
> +	if (!ls_connector->i2c)
> +		return false;
> +
> +	adapter = ls_connector->i2c->adapter;
> +	if (i2c_transfer(adapter, &msgs, 1) != 1) {
> +		DRM_DEBUG_KMS("display-%d not connect\n", ls_connector->id);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static enum drm_connector_status
> +loongson_detect(struct drm_connector *connector, bool force)
> +{
> +	struct loongson_connector *lconnector;
> +	enum drm_connector_status ret = connector_status_disconnected;
> +
> +	lconnector = to_loongson_connector(connector);
> +
> +	if (is_connected(lconnector))
> +		ret = connector_status_connected;
> +
> +	return ret;

No need for the ret variable.

	struct loongson_connector *lconnector =
				to_loongson_connector(connector);

	if (is_connected(lconnector))
		return connector_status_connected;

	return connector_status_disconnected;

>  }
>  
>  static const struct drm_connector_helper_funcs loongson_connector_helper = {
> @@ -17,6 +70,7 @@ static const struct drm_connector_helper_funcs loongson_connector_helper = {
>  };
>  
>  static const struct drm_connector_funcs loongson_connector_funcs = {
> +	.detect = loongson_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
> @@ -37,11 +91,17 @@ int loongson_connector_init(struct loongson_device *ldev, int index)
>  
>  	lconnector->ldev = ldev;
>  	lconnector->id = index;
> +	lconnector->i2c_id = index + DC_I2C_BASE;
> +
> +	lconnector->i2c = loongson_i2c_bus_match(ldev, lconnector->i2c_id);
> +	if (!lconnector->i2c)
> +		DRM_INFO("connector-%d match i2c-%d err\n", index,
> +			 lconnector->i2c_id);
>  
>  	ldev->mode_info[index].connector = lconnector;
>  	connector = &lconnector->base;
>  	drm_connector_init(ldev->dev, connector, &loongson_connector_funcs,
> -			   DRM_MODE_CONNECTOR_Unknown);
> +			DRM_MODE_CONNECTOR_Unknown);
>  	drm_connector_helper_add(connector, &loongson_connector_helper);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
> index e405199a3df6..252be9e25aff 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.c
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -11,9 +11,10 @@
>  
>  /* Interface history:
>   * 0.1 - original.
> + * 0.2 - add i2c and connector detect.
>   */
>  #define DRIVER_MAJOR 0
> -#define DRIVER_MINOR 1
> +#define DRIVER_MINOR 2
>  
>  static const struct drm_mode_config_funcs loongson_mode_funcs = {
>  	.fb_create = drm_gem_fb_create,
> @@ -31,6 +32,7 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
>  	resource_size_t aper_size;
>  	resource_size_t mmio_base;
>  	resource_size_t mmio_size;
> +	u32 ret;
>  
>  	/* GPU MEM */
>  	/* We need get 7A-gpu pci device information for ldev->gpu_pdev */
> @@ -72,6 +74,18 @@ static int loongson_device_init(struct drm_device *dev, uint32_t flags)
>  	if (ldev->io == NULL)
>  		return -ENOMEM;
>  
> +	ret = loongson_dc_gpio_init(ldev);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize dc gpios\n");
> +		return ret;
> +	}
> +
> +	ret = loongson_i2c_init(ldev);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize dc i2c\n");
> +		return ret;
> +	}
> +
>  	DRM_INFO("DC mmio base 0x%llx size 0x%llx io 0x%llx\n",
>  		 mmio_base, mmio_size, *(u64 *)ldev->io);
>  	DRM_INFO("GPU vram start = 0x%x size = 0x%x\n",
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
> index 498d1b082a19..24a534c3c79c 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.h
> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
> @@ -18,6 +18,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_encoder.h>
> +#include "loongson_i2c.h"
>  
>  /* General customization:
>   */
> @@ -28,6 +29,7 @@
>  
>  #define to_loongson_crtc(x) container_of(x, struct loongson_crtc, base)
>  #define to_loongson_encoder(x) container_of(x, struct loongson_encoder, base)
> +#define to_loongson_connector(x) container_of(x, struct loongson_connector, base)
>  
>  #define LS7A_CHIPCFG_REG_BASE (0x10010000)
>  #define PCI_DEVICE_ID_LOONGSON_DC 0x7a06
> @@ -92,8 +94,10 @@ struct loongson_encoder {
>  struct loongson_connector {
>  	struct drm_connector base;
>  	struct loongson_device *ldev;
> +	struct loongson_i2c *i2c;
>  	u16 id;
>  	u32 type;
> +	u16 i2c_id;
>  };
>  
>  struct loongson_mode_info {
> @@ -115,6 +119,9 @@ struct loongson_device {
>  	u32 num_crtc;
>  	struct loongson_mode_info mode_info[2];
>  	struct pci_dev *gpu_pdev; /* LS7A gpu device info */
> +
> +	struct loongson_i2c i2c_bus[LS_MAX_I2C_BUS];
> +	struct gpio_chip chip;
>  };
>  
>  /* crtc */
> @@ -129,6 +136,9 @@ int loongson_encoder_init(struct loongson_device *ldev, int index);
>  /* plane */
>  int loongson_plane_init(struct loongson_crtc *lcrtc);
>  
> +/* i2c */
> +int loongson_dc_gpio_init(struct loongson_device *ldev);
> +
>  /* device */
>  u32 loongson_gpu_offset(struct drm_plane_state *state);
>  u32 ls7a_mm_rreg(struct loongson_device *ldev, u32 offset);
> diff --git a/drivers/gpu/drm/loongson/loongson_i2c.c b/drivers/gpu/drm/loongson/loongson_i2c.c
> new file mode 100644
> index 000000000000..ef06a6787e34
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_i2c.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_i2c.h"
> +#include "loongson_drv.h"
> +#include "linux/gpio.h"
> +#include <linux/gpio/consumer.h>
> +
> +static struct gpio i2c_gpios[4] = {
> +	{ .gpio = DC_GPIO_0, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-sda" },
> +	{ .gpio = DC_GPIO_1, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-6-scl" },
> +	{ .gpio = DC_GPIO_2, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-sda" },
> +	{ .gpio = DC_GPIO_3, .flags = GPIOF_OPEN_DRAIN, .label = "i2c-7-scl" },
> +};
> +
> +static inline void __dc_gpio_set_dir(struct loongson_device *ldev,
> +				     unsigned int pin, int input)
> +{
> +	u32 temp;
> +
> +	temp = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_CFG_OFFSET);
> +
> +	if (input)
> +		temp |= 1UL << pin;
> +	else
> +		temp &= ~(1UL << pin);
> +
> +	ls7a_mm_wreg(ldev, LS7A_DC_GPIO_CFG_OFFSET, temp);
> +}
> +
> +static void __dc_gpio_set_val(struct loongson_device *ldev,
> +			      unsigned int pin, int high)
> +{
> +	u32 temp;
> +
> +	temp = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_OUT_OFFSET);
> +
> +	if (high)
> +		temp |= 1UL << pin;
> +	else
> +		temp &= ~(1UL << pin);
> +
> +	ls7a_mm_wreg(ldev, LS7A_DC_GPIO_OUT_OFFSET, temp);
> +}
> +
> +static int ls_dc_gpio_request(struct gpio_chip *chip, unsigned int pin)
> +{
> +	if (pin >= (chip->ngpio + chip->base))
> +		return -EINVAL;
> +	else
> +		return 0;

Get rid of the else statement.

	if (pin >= (chip->ngpio + chip->base))
		return -EINVAL;
	return 0;

> +}
> +
> +static int ls_dc_gpio_dir_input(struct gpio_chip *chip, unsigned int pin)
> +{
> +	struct loongson_device *ldev;
> +
> +	ldev = container_of(chip, struct loongson_device, chip);

In the initializer block.

> +	__dc_gpio_set_dir(ldev, pin, 1);
> +
> +	return 0;
> +}
> +
> +static int ls_dc_gpio_dir_output(struct gpio_chip *chip,
> +				 unsigned int pin, int value)
> +{
> +	struct loongson_device *ldev;
> +
> +	ldev = container_of(chip, struct loongson_device, chip);
> +	__dc_gpio_set_val(ldev, pin, value);
> +	__dc_gpio_set_dir(ldev, pin, 0);
> +
> +	return 0;
> +}
> +
> +static void ls_dc_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
> +{
> +	struct loongson_device *ldev;
> +
> +	ldev = container_of(chip, struct loongson_device, chip);
> +	__dc_gpio_set_val(ldev, pin, value);
> +}
> +
> +static int ls_dc_gpio_get(struct gpio_chip *chip, unsigned int pin)
> +{
> +	u32 val;
> +	struct loongson_device *ldev;
> +
> +	ldev = container_of(chip, struct loongson_device, chip);
> +	val = ls7a_mm_rreg(ldev, LS7A_DC_GPIO_IN_OFFSET);
> +	return (val >> pin) & 1;
> +}
> +
> +static void loongson_i2c_set_data(void *i2c, int value)
> +{
> +	struct loongson_i2c *li2c = i2c;
> +	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
> +
> +	gpiod_set_value_cansleep(gpiod, value);
> +}
> +
> +static void loongson_i2c_set_clock(void *i2c, int value)
> +{
> +	struct loongson_i2c *li2c = i2c;
> +	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
> +
> +	gpiod_set_value_cansleep(gpiod, value);
> +}
> +
> +static int loongson_i2c_get_data(void *i2c)
> +{
> +	struct loongson_i2c *li2c = i2c;
> +	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->data].gpio);
> +
> +	return gpiod_get_value_cansleep(gpiod);
> +}
> +
> +static int loongson_i2c_get_clock(void *i2c)
> +{
> +	struct loongson_i2c *li2c = i2c;
> +	struct gpio_desc *gpiod = gpio_to_desc(i2c_gpios[li2c->clock].gpio);
> +
> +	return gpiod_get_value_cansleep(gpiod);
> +}
> +
> +static int loongson_i2c_create(struct loongson_i2c *li2c, const char *name)
> +{
> +	int ret;
> +	unsigned int i2c_num;

Get rid fo this variable and use li2c->i2c_id directly.

> +	struct i2c_client *i2c_cli;
> +	struct i2c_adapter *i2c_adapter;
> +	struct i2c_board_info i2c_info;
> +	struct i2c_algo_bit_data *i2c_algo_data;
> +	struct device *dev;
> +
> +	dev = &li2c->adapter->dev;

Put this in the initializer.

	struct device *dev = &li2c->adapter->dev;

> +	i2c_num = li2c->i2c_id;
> +	i2c_adapter = kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);
> +	if (IS_ERR(i2c_adapter)) {

kzalloc returns NULL on error.

> +		ret = PTR_ERR(i2c_adapter);
> +		goto error_mem;

No need for this goto.  There is no need to print a warning if kmalloc()
fails.  Just do:

	if (!i2c_adapter)
		return -ENOMEM;

> +	}
> +	i2c_algo_data = kzalloc(sizeof(struct i2c_algo_bit_data), GFP_KERNEL);
> +	if (IS_ERR(i2c_algo_data)) {
> +		ret = PTR_ERR(i2c_algo_data);
> +		goto error_mem;

Leaks memory.

	if (!i2c_algo_data) {
		ret = -ENOMEM;
		goto free_adapter;
	}


> +	}
> +
> +	i2c_adapter->owner = THIS_MODULE;
> +	i2c_adapter->class = I2C_CLASS_DDC;
> +	i2c_adapter->algo_data = i2c_algo_data;
> +	i2c_adapter->nr = i2c_num;
> +	snprintf(i2c_adapter->name, sizeof(i2c_adapter->name), "%s%d",
> +		 name, i2c_num - DC_I2C_BASE);
> +
> +	li2c->data = i2c_num % DC_I2C_BASE * 2;
> +	li2c->clock = i2c_num % DC_I2C_BASE * 2 + 1;
> +	DRM_INFO("Created i2c-%d, sda=%d, scl=%d\n",
> +		 i2c_num, li2c->data, li2c->clock);
> +
> +	if (gpio_cansleep(i2c_gpios[li2c->data].gpio) ||
> +	    gpio_cansleep(i2c_gpios[li2c->clock].gpio))
> +		dev_warn(dev, "Slow GPIO pins might wreak havoc I2C timing\n");
> +
> +	i2c_algo_data->setsda = loongson_i2c_set_data;
> +	i2c_algo_data->setscl = loongson_i2c_set_clock;
> +	i2c_algo_data->getsda = loongson_i2c_get_data;
> +	i2c_algo_data->getscl = loongson_i2c_get_clock;
> +	i2c_algo_data->udelay = DC_I2C_TON;
> +	i2c_algo_data->timeout = usecs_to_jiffies(2200);
> +
> +	ret = i2c_bit_add_numbered_bus(i2c_adapter);
> +	if (ret) {
> +		DRM_ERROR("Failed to register i2c algo-bit adapter %s\n",
> +			  i2c_adapter->name);
> +		kfree(i2c_adapter);
> +		i2c_adapter = NULL;

No need to assign this to NULL.  It leaks algo_data;

> +	}

	if (ret)
		goto free_algo_data;


> +
> +	li2c->adapter = i2c_adapter;
> +	i2c_algo_data->data = li2c;
> +	i2c_set_adapdata(li2c->adapter, li2c);
> +	DRM_INFO("Register i2c algo-bit adapter [%s]\n", i2c_adapter->name);
> +
> +	memset(&i2c_info, 0, sizeof(struct i2c_board_info));
> +	strncpy(i2c_info.type, name, I2C_NAME_SIZE);
> +	i2c_info.addr = DDC_ADDR;
> +	i2c_cli = i2c_new_client_device(i2c_adapter, &i2c_info);
> +	if (i2c_cli == NULL) {

Write these as:

	if (!i2c_cli)

But actually i2c_new_client_device() returns error pointers.

	if (IS_ERR(i2c_cli)) {
		ret = PTR_ERR(i2c_cli);



> +		DRM_ERROR("Failed to create i2c adapter\n");
> +		return -EBUSY;

Leaks stuff.

		goto remove_numbered_bus?

> +	}
> +	li2c->init = true;
> +	return 0;
> +
> +error_mem:
> +	DRM_ERROR("Failed to malloc memory for loongson i2c\n");
> +	return ret;


remove_numbered_bus:
	do something()?
free_algo_data:
	kfree(i2c_algo_data);
free_adapter:
	kfree(i2c_adapter);

	return ret;

> +}
> +
> +static int loongson_i2c_add(struct loongson_device *ldev, const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < LS_MAX_I2C_BUS; i++) {
> +		if (ldev->i2c_bus[i].use)

Flip this around.  Always do error handling instead of success handling.

		if (!ldev->i2c_bus[i].use) {
			DRM_DEBUG_DRIVER("i2c_bus[%d] not use\n", i);
			return -ENODEV;
		}


> +			loongson_i2c_create(&ldev->i2c_bus[i], name);

Pull this code back a tab.  Check for errors.

		ret = loongson_i2c_create(&ldev->i2c_bus[i], name);
		if (ret)
			return ret;


> +		else {
> +			DRM_DEBUG_DRIVER("i2c_bus[%d] not use\n", i);
> +			return -ENODEV;
> +		}
> +	}
> +	return 0;
> +}
> +
> +int loongson_dc_gpio_init(struct loongson_device *ldev)
> +{
> +	int ret;
> +	struct gpio_chip *chip;

	struct gpio_chip *chip = &ldev->chip;
	int ret;

> +
> +	chip = &ldev->chip;
> +	chip->label = "ls7a-dc-gpio";
> +	chip->base = LS7A_DC_GPIO_BASE;
> +	chip->ngpio = 4;
> +	chip->parent = ldev->dev->dev;
> +	chip->request = ls_dc_gpio_request;
> +	chip->direction_input = ls_dc_gpio_dir_input;
> +	chip->direction_output = ls_dc_gpio_dir_output;
> +	chip->set = ls_dc_gpio_set;
> +	chip->get = ls_dc_gpio_get;
> +	chip->can_sleep = false;
> +
> +	ret = devm_gpiochip_add_data(ldev->dev->dev, chip, ldev);
> +	if (ret) {
> +		DRM_ERROR("Failed to register ls7a dc gpio driver\n");
> +		return -ENODEV;

		return ret;

> +	}
> +	DRM_INFO("Registered ls7a dc gpio driver\n");
> +
> +	return 0;
> +}
> +
> +int loongson_i2c_init(struct loongson_device *ldev)
> +{
> +	int ret;
> +
> +	ret = gpio_request_array(i2c_gpios, ARRAY_SIZE(i2c_gpios));
> +	if (ret) {
> +		DRM_ERROR("Failed to request gpio array i2c_gpios\n");
> +		return -ENODEV;

		return ret;

> +	}
> +
> +	ldev->i2c_bus[0].i2c_id = 6;
> +	ldev->i2c_bus[0].use = true;
> +	ldev->i2c_bus[1].i2c_id = 7;
> +	ldev->i2c_bus[1].use = true;
> +
> +	loongson_i2c_add(ldev, DC_I2C_NAME);

check for errors.

> +
> +	return 0;
> +}
> +
> +struct loongson_i2c *loongson_i2c_bus_match(struct loongson_device *ldev, u32 i2c_id)
> +{
> +	u32 i;
> +	struct loongson_i2c *match = NULL, *tables;
> +
> +	tables = ldev->i2c_bus;
> +
> +	for (i = 0; i < LS_MAX_I2C_BUS; i++) {

		table = &ldev->i2c_bus[i];

> +		if (tables->i2c_id == i2c_id && tables->init == true) {
> +			match = tables;
> +			break;

Just return instead of break:

			return table;

> +		}
> +
> +		tables++;
> +	}
> +
> +	return match;
> +}

regards,
dan carpenter

