Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410C68B363
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 01:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A207010E301;
	Mon,  6 Feb 2023 00:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1F10E2BD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qw12so29904587ejc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=VIi2F2pZUyy+B+NkrpVYi2Q6A8T6HtVUjp+xZrhdeLDnUrs9JJt8xQN5RJMOD7e/QZ
 jrv0LLpF+vpQFEHuS6j4Ddg9BuY1RiS4hN+KvZRrDyyXarc2G2qSBdU+jovnjW8nHx8y
 mCyHS1kyjOEINo8dmpU9uJyj3Smmd05pxwdrBogkW2kD4lBHMCezNHO7BruPzUcRAveO
 Q9xLuxocys0S/bJNmt7BCqbJd73YEAtuHMiPdgFxCO790OSC/dzf5jxPAtOmq7b08QVj
 t2UeuopfepJRPuA2WnObK0XAytjULT4h2gvpHWSCvItuqEdHfD34N1+fGthq2RL6SlPl
 ncEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=zmRfLmRV8A8eUQF6in13SsPXtka8ltlyclCaStZDkeh/e5lQOlukGieqkhH5sFVsuw
 WBVZoHBze+XCR5PzhFpY/Vsvemwi0OFuASPyd/XGm7pyDoXhzoTDKZ9V+OKR/Qe13zJV
 UYzbM3PdgWf1LfIzBZjOQ1IbE9t6VAyn+4jE6WkiQV7k0EUsp6JvdOuMeCv9k08OzCts
 MyMcxbiB07NMieZe1cl/Hbj9quA15JzmkTT+FmJqbsCu2/HI/JEhSdlua8evkDO0P8iW
 lFPJM9DYzAnajY8OkzjJc4QUW2fg0yFto7lH1zUP0vefUKadjqCraDUcFcBJF7j0bPHM
 f8Aw==
X-Gm-Message-State: AO0yUKWxxK4EK2/qVriTL7dXycOLeRpKXxSV4knKQgnwLBkstIaSBhlq
 MrDFWsuwN+jst6N6bLPY7Nw7fA==
X-Google-Smtp-Source: AK7set/4Albb6Tlbe9anok/PLMa3zrG4HRemMWmi/keMOrlZr+NTLlu0MlRZyw7atb7i2HtJ4j8Y5g==
X-Received: by 2002:a17:907:cb20:b0:885:2eb5:68a2 with SMTP id
 um32-20020a170907cb2000b008852eb568a2mr16411673ejc.16.1675643262670; 
 Sun, 05 Feb 2023 16:27:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 3/8] dt-bindings: display/msm/gmu: add Adreno 660 support
Date: Mon,  6 Feb 2023 02:27:30 +0200
Message-Id: <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1

