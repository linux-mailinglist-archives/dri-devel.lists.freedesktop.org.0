Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75914E80E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 05:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDB86E1E8;
	Fri, 31 Jan 2020 04:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0E46E1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 04:58:39 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00V4vt2U194365;
 Fri, 31 Jan 2020 04:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=+I6RfZxDTErkgikWYprG/z/JStkYXUsW5y5QJH/rzTA=;
 b=jCb7+HfwhDDI3Oacu5UPSWDNzB4Y29Dr2c7zc/4XiOhrfaoRVuRO8/8uKvSSjHfLoTe/
 KPasM4qmSjyJCrtNTvcbCPBBkMM17SdAhV1GVbPwdEOH1i3975ANxXdq+i8lvQFTL/Cu
 PFCAByzxMOMMnTGv+fQ6R9sFjfG7MMOMfai0fqpWlcclAFS51hfnVv4T1qJUJFXYoXjW
 jtPxtCdvWX6USFoBFri2EaJWPCAwOrwGfyeUbR6ENw3Kwc5C7lkKdm9Q8Ex9mrj7bhd3
 WxqMSRvmwOe0CCtfx2myA+evreQoc6IE5aOPjydzMvh0V03GssvsgJUES3aOnW6yPvyx Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2xrd3ur3sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2020 04:58:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00V4wVv6182854;
 Fri, 31 Jan 2020 04:58:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2xv8nq0s6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2020 04:58:32 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00V4vpEQ009294;
 Fri, 31 Jan 2020 04:57:51 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jan 2020 20:57:50 -0800
Date: Fri, 31 Jan 2020 07:57:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Harry Wentland <harry.wentland@amd.com>, Lewis Huang <Lewis.Huang@amd.com>
Subject: [PATCH] drm/amd/display: Possible divide by zero in set_speed()
Message-ID: <20200131045739.ault4d6yk2lqlbed@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9516
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001310043
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9516
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001310043
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
Cc: Derek Lai <Derek.Lai@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If "speed" is zero then we use it as a divisor to find "prescale".  It's
better to move the check for zero to the very start of the function.

Fixes: 9eeec26a1339 ("drm/amd/display: Refine i2c frequency calculating sequence")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
index 066188ba7949..24adec407972 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
@@ -267,6 +267,9 @@ static void set_speed(
 	uint32_t xtal_ref_div = 0;
 	uint32_t prescale = 0;
 
+	if (speed == 0)
+		return;
+
 	REG_GET(MICROSECOND_TIME_BASE_DIV, XTAL_REF_DIV, &xtal_ref_div);
 
 	if (xtal_ref_div == 0)
@@ -274,17 +277,15 @@ static void set_speed(
 
 	prescale = ((dce_i2c_hw->reference_frequency * 2) / xtal_ref_div) / speed;
 
-	if (speed) {
-		if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
-			REG_UPDATE_N(SPEED, 3,
-				     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
-				     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
-				     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
-		else
-			REG_UPDATE_N(SPEED, 2,
-				     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
-				     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
-	}
+	if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
+		REG_UPDATE_N(SPEED, 3,
+			     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
+			     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
+			     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
+	else
+		REG_UPDATE_N(SPEED, 2,
+			     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
+			     FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
 }
 
 static bool setup_engine(
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
