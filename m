Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739663C3E5A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 19:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CC989ACC;
	Sun, 11 Jul 2021 17:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Sun, 11 Jul 2021 17:30:06 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CEE89ACC;
 Sun, 11 Jul 2021 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626024603;
 bh=AnCY0pjNVPxfMlK/RMJloKhD8Gf9lUzrKmoISOVbvLE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Z2Z+NpPbjrlBjmFDmnz2ulOxTGl6LM0nCUd7j9eAeS2XzY9ob+vG8/AoUbwUjzhaM
 M497caiFpHIz/Rkfnd+7MCiXLgOZIb0ys8hhYO7CODUrJgSKRGhr7UW22xhWNjLR84
 yCQzAcK3AIz/0I8kK32m+BUsLYC5XNOMG/4TxNO4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MUGe1-1lbRWo0pRD-00RIK7; Sun, 11 Jul 2021 19:24:53 +0200
From: Len Baker <len.baker@gmx.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Fix identical code for different branches
Date: Sun, 11 Jul 2021 19:24:33 +0200
Message-Id: <20210711172433.2777-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y3gzwZrH3SZG80PK9ruDRlopijLNaqyUfz3yCTcTZ7jUMp6kn+f
 Tx5otUZe2s3OfMm9+BPkH8unLbEPc1a0/kZhoUaW1YOK9gmNKBKJCwvmzXP6leaVdpatS8U
 B1iXIqAzC8kSVw2eSqWvCGxztVaLL3RG3KB72Mt1bGw91fWJsF7kByjyIwuIHITd1MHps79
 uD4CRPByosFd4JbGAY7nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UCiGv2++TLQ=:sfXYGqrdwxlyUhO4/d9c5Y
 cCZgcBOy3GiNTq4tAmXEwpIQMJkc1Sru4NOG4GUk3D4/9s73dX8dlTJCtPrs06A0Hgm4hrUfi
 axIkuz0aUXYkzVR9vl3b/NlspFd6bx6BUApijS+QgESN580XQ2s0L3CWKtdVDe1zUXT4wUtpk
 KBzRBlQWqRGy36kM53dtAN13mMP+jt/dJjERGlUV2+4R+0latYylDOvFqU3dwy5SQRZe1zy/0
 1Slp4AghHV4PuUyrqdLkYAfj2q91zZYkUNETw5V0kJCd9K7QSMSa4THpCmBNDHQxopkxhQRjw
 +qZunvntkawIh+vdq75Id6SUsweyxADJfOioAdE9T+oNQht0j+wG5fYZV4we4Sy9FOYS/Lu18
 QJXvp4ugZ28RPBLSXRVEKqqOuN7ciwVxmji+S1TT3aZM6uQQ6w4Qv3OPBT/jaASsgwwwrRGxl
 hA0izeGycX+WtM+rMHgyNpXk7JFu0Bx88rPhaBDZODKij68qEKlfwy4LsXt4r3c4324jcW4Jt
 b6X9gPp64ZahgkBDzEz87y93baYE0E5GyG98Gq0QA4H2hFnuo8ugCmNQlsOB1K3/1bwBerEnp
 iX7ooqIR5e1lAO8SpheKreAgYIECy5h9xcJvH7oWoPPJKzh49wzhp74oeke4e85gYyYtuwHY7
 EFu+oXf848yQZbkyvpUprxSEXsM0m9UEk8LhqPgJYUEVQZJYO6zQ2qEruPzgdU5OaNzO6TTo0
 JrNbBQjNEsvWX7x4NGnRmQt2Qk1RWld6SycjJfgEBvn0TTQS1tESTx9UPO0ZGDJXF87BIcQXD
 m1mLMEcXT/B95/+unXVJB2cL9PtPz5GGewGewUx8JXQj8+d8BOQK4KupGP4XJ50aXAmc5NA2/
 bk0dZPfO+aokc/m7YR/OjB63AZnTSa/O4NhclJFU6r/HzP8bPa0nmj/hqoNSCHhTzWTP1+nvd
 +0itQfuZSBSqcIcOGEQB0HSoSQNl3XVe5rZ1QS4FbdHXdOiOoO2XSvog/9EhFv3VwdgGb9e4q
 JSsM3lv15qlz9fgqB3ZQJpFoDOBPPvTR6ebh5pW6klmV6J770WVtVfqDXfBV2I4DD7FqptpUG
 jelt/88eDZnAfJEbyum7i3rRJ1YUHrO6rSn
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
Cc: Martin Tsai <martin.tsai@amd.com>, Kees Cook <keescook@chromium.org>,
 Wenjing Liu <wenjing.liu@amd.com>, Yu-ting Shen <Yu-ting.Shen@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Len Baker <len.baker@gmx.com>, dri-devel@lists.freedesktop.org,
 George Shen <George.Shen@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The branches of the "if" statement are the same. So remove the
unnecessary if and goto statements.

Addresses-Coverity-ID: 1456916 ("Identical code for different branches")
Fixes: 4c283fdac08ab ("drm/amd/display: Add HDCP module")
Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/=
drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
index de872e7958b0..d0c565567102 100644
=2D-- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
@@ -305,10 +305,8 @@ static enum mod_hdcp_status wait_for_ready(struct mod=
_hdcp *hdcp,
 				hdcp, "bcaps_read"))
 			goto out;
 	}
-	if (!mod_hdcp_execute_and_set(check_ksv_ready,
-			&input->ready_check, &status,
-			hdcp, "ready_check"))
-		goto out;
+	mod_hdcp_execute_and_set(check_ksv_ready, &input->ready_check, &status,
+				 hdcp, "ready_check");
 out:
 	return status;
 }
=2D-
2.25.1

