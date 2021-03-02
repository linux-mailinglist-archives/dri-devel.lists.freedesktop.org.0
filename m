Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B0329BA0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 12:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AED36E145;
	Tue,  2 Mar 2021 11:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4395F6E145;
 Tue,  2 Mar 2021 11:16:18 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 122BF2UZ177266;
 Tue, 2 Mar 2021 11:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7H28G1DxFeZh+yvnNT1Eq47Y3dZE6uU2Z6ZfhdPef3o=;
 b=DsuxZLeXBxVfSVyErd3TFruHmqBWTVC4/zQ6FzmNhmWCFC5vG3GuVytYhx9criqsu+W4
 kL7+LfNMU61CWpQ/3h4rwGPuKGROgrvwO6q04TSS39kxk8WYkZWlXWR57aLClHz8kWPq
 NO2MIJfdOQIDGVy/vN9s0G6M0SMPpdLlrbxC9XEKXxotgjofvd0PklQVGcT5p8Lfn+7g
 CaVoeZ53Z0Pi9P1onEbLUhadbxGGcY8c298z/r5AnuLQpUQEF+Xvyy0sKcB9bVwIsmf9
 14nQB4JnEHiaQg13r753pv728Mjz4rhbvZssHXpP27NF5+IgraJaiGFCssnjm9rLOYjm 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36ybkb7a6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 11:16:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 122BAWsZ063870;
 Tue, 2 Mar 2021 11:16:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 36yyuruxv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 11:16:11 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 122BFwIQ026362;
 Tue, 2 Mar 2021 11:16:02 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Mar 2021 03:15:58 -0800
Date: Tue, 2 Mar 2021 14:15:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH] drm/amd/display: Fix off by one in
 hdmi_14_process_transaction()
Message-ID: <YD4eZLCFU+fbTGIp@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020094
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
Cc: kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdcp_i2c_offsets[] array did not have an entry for
HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE so it led to an off by one
read overflow.  I added an entry and copied the 0x0 value for the offset
from similar code in drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c.

I also declared several of these arrays as having HDCP_MESSAGE_ID_MAX
entries.  This doesn't change the code, but it's just a belt and
suspenders approach to try future proof the code.

Fixes: 4c283fdac08a ("drm/amd/display: Add HDCP module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis, as mentioned in the commit message the offset
is basically an educated guess.

I reported this bug on Apr 16, 2020 but I guess we lost take of it.

 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
index 5e384a8a83dc..51855a2624cf 100644
--- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
+++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
@@ -39,7 +39,7 @@
 #define HDCP14_KSV_SIZE 5
 #define HDCP14_MAX_KSV_FIFO_SIZE 127*HDCP14_KSV_SIZE
 
-static const bool hdcp_cmd_is_read[] = {
+static const bool hdcp_cmd_is_read[HDCP_MESSAGE_ID_MAX] = {
 	[HDCP_MESSAGE_ID_READ_BKSV] = true,
 	[HDCP_MESSAGE_ID_READ_RI_R0] = true,
 	[HDCP_MESSAGE_ID_READ_PJ] = true,
@@ -75,7 +75,7 @@ static const bool hdcp_cmd_is_read[] = {
 	[HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] = false
 };
 
-static const uint8_t hdcp_i2c_offsets[] = {
+static const uint8_t hdcp_i2c_offsets[HDCP_MESSAGE_ID_MAX] = {
 	[HDCP_MESSAGE_ID_READ_BKSV] = 0x0,
 	[HDCP_MESSAGE_ID_READ_RI_R0] = 0x8,
 	[HDCP_MESSAGE_ID_READ_PJ] = 0xA,
@@ -106,7 +106,8 @@ static const uint8_t hdcp_i2c_offsets[] = {
 	[HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_SEND_ACK] = 0x60,
 	[HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_STREAM_MANAGE] = 0x60,
 	[HDCP_MESSAGE_ID_READ_REPEATER_AUTH_STREAM_READY] = 0x80,
-	[HDCP_MESSAGE_ID_READ_RXSTATUS] = 0x70
+	[HDCP_MESSAGE_ID_READ_RXSTATUS] = 0x70,
+	[HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] = 0x0,
 };
 
 struct protection_properties {
@@ -184,7 +185,7 @@ static const struct protection_properties hdmi_14_protection = {
 	.process_transaction = hdmi_14_process_transaction
 };
 
-static const uint32_t hdcp_dpcd_addrs[] = {
+static const uint32_t hdcp_dpcd_addrs[HDCP_MESSAGE_ID_MAX] = {
 	[HDCP_MESSAGE_ID_READ_BKSV] = 0x68000,
 	[HDCP_MESSAGE_ID_READ_RI_R0] = 0x68005,
 	[HDCP_MESSAGE_ID_READ_PJ] = 0xFFFFFFFF,
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
